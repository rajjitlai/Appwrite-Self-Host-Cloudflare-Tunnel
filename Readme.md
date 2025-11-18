# Appwrite Server Setup

This is a complete Appwrite backend infrastructure designed for secure, production-ready deployment using containerization.

## 🏗️ Architecture

- Microservices orchestrated via Docker Compose
- Cloudflare Tunnel enables secure external access without opening firewall ports
- Local data persistence in the `./data/` directory

## 📁 Directory Structure

```
.
├── docker-compose.yml   # Service definitions
├── .env                 # Environment variables (copy from .env.example)
├── .env.example         # Environment variables example
├── .gitignore
├── Readme.md            # This file
├── setup.sh             # Setup script for Linux/macOS
├── setup.bat            # Setup script for Windows
├── cloudflared/         # Cloudflare tunnel configuration (optional)
│   ├── config.yml       # Tunnel configuration
│   └── *.json           # Tunnel credentials
└── data/                # Persistent volumes (created automatically)
    ├── mariadb/         # MySQL data
    ├── redis/           # Redis data
    ├── uploads/         # User file uploads
    ├── cache/
    ├── config/
    ├── functions/
    ├── sites/
    ├── builds/
    └── imports/
```

## 🔧 Core Features

- Full Appwrite console and API access
- Realtime capabilities via WebSocket
- Background workers for audits, webhooks, deletes, builds, mails, etc.
- Scheduled tasks and maintenance jobs
- Built-in monitoring and health checks

## 🚀 Getting Started

1. **Clone this repository**
   ```bash
   git clone <repository-url>
   cd Appwrite-Server
   ```

2. **Run the setup script**
   
   On Linux/macOS:
   ```bash
   ./setup.sh
   ```
   
   On Windows:
   ```cmd
   setup.bat
   ```

3. **Edit the .env file**
   Update the `.env` file with your secure values, especially:
   - Database credentials
   - Domain settings
   - Security keys

4. **Start the services**
   ```bash
   docker-compose up -d
   ```

5. **Access Appwrite**
   - **Console**: http://localhost/console
   - **API**: http://localhost

## ☁️ Optional: Cloudflare Tunnel Setup

For secure remote access without exposing ports, you can use Cloudflare Tunnel:

1. **Create a Cloudflare Tunnel**:
   - Log in to your Cloudflare dashboard
   - Go to Access > Tunnels > Create a tunnel
   - Follow the setup instructions

2. **Configure the tunnel**:
   - Edit `cloudflared/config.yml` with your tunnel details
   - Update the hostname to match your domain
   - Replace `your-tunnel-id.json` with your actual credentials file

3. **Enable the service**:
   - Uncomment the `cloudflared` service in `docker-compose.yml`
   - Uncomment the port mappings for Traefik if needed

4. **Start with Cloudflare**:
   ```bash
   docker-compose up -d
   ```

## 🛠️ Configuration

### Environment Variables

Refer to `.env.example` for all available configuration options. At a minimum, you should set:

- `_APP_DOMAIN` - Your domain (default: localhost)
- Database passwords
- Redis password (if needed)
- OpenSSL key for encryption

### Data Persistence

All data is stored in the `./data/` directory, which is automatically created when you start the services. This includes:
- Database files
- Uploaded files
- Function code
- Cache data
- Configuration files

## 🔄 Maintenance

### Updating Appwrite

1. Stop the services:
   ```bash
   docker-compose down
   ```

2. Pull the latest images:
   ```bash
   docker-compose pull
   ```

3. Start the services:
   ```bash
   docker-compose up -d
   ```

### Backup

To backup your data, simply copy the `./data/` directory to a safe location.

### Logs

View logs for any service:
```bash
docker-compose logs <service-name>
```

For example:
```bash
docker-compose logs appwrite
```

## 🧪 Health Check

You can check if the service is running properly:
```bash
curl http://localhost/health
```

## 🔒 Security Notes

- The `.env` file is excluded from version control for security
- All services run in isolated containers
- No ports are exposed directly to the host (except Traefik handles HTTP/HTTPS)
- Use strong passwords for database and Redis
- Generate a secure OpenSSL key for `_APP_OPENSSL_KEY_V1`

## 📦 Portability

This setup is completely portable - you can:
1. Zip the entire directory
2. Transfer to another machine
3. Unzip and run `docker-compose up -d`

All data will be preserved in the `./data/` directory, making this a truly portable Appwrite installation.

## 🆘 Troubleshooting

### Common Issues

1. **Port already in use**: Make sure ports 80 and 443 are free on your host
2. **Permission errors**: Ensure Docker has permission to bind mount the data directories
3. **Database connection issues**: Check database credentials in `.env`

### Reset Everything

To completely reset your installation:
```bash
docker-compose down -v
rm -rf data/
```

Then start fresh with:
```bash
docker-compose up -d
```