<p align="center">
  <img src="https://appwrite.io/images/logos/appwrite.svg" alt="Appwrite Logo" width="200" />
  <br />
   &
  <br />
  <img src="https://cf-assets.www.cloudflare.com/dzlvafdwdttg/735eoClKJf9XfkqCJs1mfZ/b6767158f39af8d538517df918b8fc2e/logo-white-desktop.svg" alt="Cloudflare Logo" width="200" />
</p>

<h1 align="center">Appwrite Self-Hosted with Cloudflare Tunnel</h1>

<p align="center">
  A complete, production-ready Appwrite backend infrastructure with secure Cloudflare Tunnel integration
</p>

<p align="center">
  <a href="https://github.com/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel/stargazers">
    <img src="https://img.shields.io/github/stars/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel" alt="GitHub Stars">
  </a>
  <a href="https://github.com/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel/issues">
    <img src="https://img.shields.io/github/issues/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel" alt="GitHub Issues">
  </a>
  <a href="https://github.com/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel" alt="License">
  </a>
</p>

## 🏗️ Architecture Overview

This self-hosted Appwrite setup features:
- **Appwrite 1.7.4** - Backend-as-a-Service platform
- **Traefik 2.11** - Reverse proxy with SSL termination
- **MariaDB 10.11** - Relational database
- **Redis 7.2.4** - In-memory cache
- **Cloudflare Tunnel** - Secure remote access (zero exposed ports)
- **Docker Compose** - Container orchestration

## 🚀 Key Features

- ✅ **Zero Port Exposure**: Secure access via Cloudflare Tunnel
- ✅ **Local Data Persistence**: All data stored in `./data/` directory
- ✅ **Portable Setup**: Zip and transfer entire installation
- ✅ **Background Workers**: Audits, webhooks, deletes, builds, mails
- ✅ **Realtime Capabilities**: WebSocket support
- ✅ **Scheduled Tasks**: Automated maintenance jobs
- ✅ **Built-in Monitoring**: Health checks and logging

## 📁 Directory Structure

```
.
├── docker-compose.yml   # Service definitions
├── .env                 # Environment variables
├── .env.example         # Configuration template
├── .gitignore
├── Readme.md            # This file
├── setup.sh             # Auto-setup script (Linux/macOS)
├── setup.bat            # Auto-setup script (Windows)
├── cloudflared/         # Cloudflare tunnel configuration
│   ├── config.yml       # Tunnel configuration
│   └── *.json           # Tunnel credentials
└── data/                # Persistent volumes
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

## 🚀 Quick Start

1. **Clone repository**
   ```bash
   git clone https://github.com/rajjitlai/Appwrite-Self-Host-Cloudflare-Tunnel
   cd Appwrite-Self-Host-Cloudflare-Tunnel
   ```

2. **Run setup**
   ```bash
   # Linux/macOS
   ./setup.sh
   
   # Windows
   setup.bat
   ```

3. **Configure environment**
   Edit `.env` with your secure values

4. **Deploy**
   ```bash
   docker-compose up -d
   ```

5. **Access**
   - Console: http://localhost/console
   - API: http://localhost

## 💾 Disk Space Requirements

**Initial Setup**: Approximately 2-3 GB for Docker images
- Appwrite services: ~1.5 GB
- MariaDB: ~400 MB
- Redis: ~100 MB
- Traefik: ~50 MB
- Cloudflared: ~50 MB

**Why Docker Uses So Much Space**:
Docker on Windows can consume significant disk space due to:
- Container images and layers
- Volume data and logs
- Build cache and temporary files
- Stopped containers and unused networks

**Managing Docker Disk Usage**:
1. Clean up unused resources:
   ```bash
   docker system prune -a
   ```
   
2. Remove unused volumes (⚠️ Deletes all data):
   ```bash
   docker volume prune
   ```
   
3. Clean build cache:
   ```bash
   docker builder prune
   ```
   
4. Check space usage:
   ```bash
   docker system df
   ```

## ☁️ Cloudflare Tunnel Setup

1. Create tunnel in Cloudflare dashboard
2. Update `cloudflared/config.yml` with your settings
3. Add your tunnel credentials JSON file
4. Uncomment `cloudflared` service in `docker-compose.yml`
5. Deploy with `docker-compose up -d`

## 🔧 Environment Variables

Key configuration options in `.env`:
- `_APP_DOMAIN` - Your domain
- Database credentials
- Redis configuration
- OpenSSL encryption key
- SMTP settings (optional)

## 📦 Portability

- Entire setup is completely portable
- Zip directory and transfer to any Docker-enabled system
- All data persists in local `./data/` directory
- No external dependencies required

## 🔒 Security

- No ports exposed to internet
- Cloudflare Tunnel for secure access
- Strong encryption with OpenSSL
- Secure credential management
- Git-ignored sensitive files

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.