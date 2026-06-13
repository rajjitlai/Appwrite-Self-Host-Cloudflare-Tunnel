#!/bin/bash

# Appwrite Setup Script

echo "🚀 Setting up Appwrite Server..."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📋 Creating .env file from example..."
    cp .env.example .env
    echo "🔑 Generating secure encryption keys..."
    if command -v python3 >/dev/null 2>&1; then
        python3 -c "import os, base64; k1=base64.b64encode(os.urandom(32)).decode(); k2=base64.b64encode(os.urandom(32)).decode(); content=open('.env').read().replace('_APP_OPENSSL_KEY_V1=your-secret-key', '_APP_OPENSSL_KEY_V1='+k1).replace('_APP_EXECUTOR_SECRET=your-secret-key', '_APP_EXECUTOR_SECRET='+k2); open('.env', 'w').write(content)"
    else
        # Fallback to openssl/urandom if python3 is not installed
        if command -v openssl >/dev/null 2>&1; then
            key1=$(openssl rand -base64 32)
            key2=$(openssl rand -base64 32)
        else
            key1=$(head -c 32 /dev/urandom | base64 | tr -d '\\n')
            key2=$(head -c 32 /dev/urandom | base64 | tr -d '\\n')
        fi
        sed -i.bak "s|_APP_OPENSSL_KEY_V1=your-secret-key|_APP_OPENSSL_KEY_V1=$key1|g" .env
        sed -i.bak "s|_APP_EXECUTOR_SECRET=your-secret-key|_APP_EXECUTOR_SECRET=$key2|g" .env
        rm -f .env.bak
    fi
    echo "✅ .env file created. Please update it with your secure values!"
else
    echo "✅ .env file already exists"
fi

# Create data directories if they don't exist
echo "📂 Creating data directories..."
mkdir -p data/mariadb data/redis data/uploads data/cache data/config data/certificates data/functions data/sites data/builds data/imports

# Create .gitkeep files in data directories
echo "📝 Creating .gitkeep files..."
touch data/mariadb/.gitkeep data/redis/.gitkeep data/uploads/.gitkeep data/cache/.gitkeep data/config/.gitkeep data/certificates/.gitkeep data/functions/.gitkeep data/sites/.gitkeep data/builds/.gitkeep data/imports/.gitkeep

# Create cloudflared logs directory
echo "📝 Creating cloudflared logs directory..."
mkdir -p cloudflared/logs
touch cloudflared/logs/.gitkeep

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Edit the .env file with your secure values"
echo "2. Run 'docker-compose up -d' to start Appwrite"
echo "3. Access the console at http://localhost/console"