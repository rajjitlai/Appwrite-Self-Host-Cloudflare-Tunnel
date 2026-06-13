@echo off
REM Appwrite Setup Script for Windows

echo 🚀 Setting up Appwrite Server...

REM Check if .env file exists
if not exist .env (
    echo 📋 Creating .env file from example...
    copy .env.example .env
    echo 🔑 Generating secure encryption keys...
    powershell -Command "$key1 = [Convert]::ToBase64String((1..32 | %% { [byte](Get-Random -Minimum 0 -Maximum 255) })); $key2 = [Convert]::ToBase64String((1..32 | %% { [byte](Get-Random -Minimum 0 -Maximum 255) })); (Get-Content .env) -replace '_APP_OPENSSL_KEY_V1=your-secret-key', ('_APP_OPENSSL_KEY_V1=' + $key1) -replace '_APP_EXECUTOR_SECRET=your-secret-key', ('_APP_EXECUTOR_SECRET=' + $key2) | Set-Content .env"
    echo ✅ .env file created. Please update it with your secure values!
) else (
    echo ✅ .env file already exists
)

REM Create data directories if they don't exist
echo 📂 Creating data directories...
mkdir data\mariadb >nul 2>&1
mkdir data\redis >nul 2>&1
mkdir data\uploads >nul 2>&1
mkdir data\cache >nul 2>&1
mkdir data\config >nul 2>&1
mkdir data\certificates >nul 2>&1
mkdir data\functions >nul 2>&1
mkdir data\sites >nul 2>&1
mkdir data\builds >nul 2>&1
mkdir data\imports >nul 2>&1

REM Create .gitkeep files in data directories
echo 📝 Creating .gitkeep files...
type nul > data\mariadb\.gitkeep
type nul > data\redis\.gitkeep
type nul > data\uploads\.gitkeep
type nul > data\cache\.gitkeep
type nul > data\config\.gitkeep
type nul > data\certificates\.gitkeep
type nul > data\functions\.gitkeep
type nul > data\sites\.gitkeep
type nul > data\builds\.gitkeep
type nul > data\imports\.gitkeep

REM Create cloudflared logs directory
echo 📝 Creating cloudflared logs directory...
mkdir cloudflared\logs >nul 2>&1
type nul > cloudflared\logs\.gitkeep

echo ✅ Setup complete!
echo.
echo Next steps:
echo 1. Edit the .env file with your secure values
echo 2. Run 'docker-compose up -d' to start Appwrite
echo 3. Access the console at http://localhost/console