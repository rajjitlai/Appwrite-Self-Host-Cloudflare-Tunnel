#!/bin/bash

# Appwrite Setup Script

echo "🚀 Setting up Appwrite Server..."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📋 Creating .env file from example..."
    cp .env.example .env
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