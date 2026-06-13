@echo off
echo 🚀 Setting up Appwrite MariaDB Server...

if not exist .env (
    echo 📋 Creating .env file from example...
    copy .env.example .env
    echo 🔑 Generating secure encryption keys...
    powershell -Command "$key1 = [Convert]::ToBase64String((1..32 | %% { [byte](Get-Random -Minimum 0 -Maximum 255) })); $key2 = [Convert]::ToBase64String((1..32 | %% { [byte](Get-Random -Minimum 0 -Maximum 255) })); (Get-Content .env) -replace '_APP_OPENSSL_KEY_V1=your-secret-key', ('_APP_OPENSSL_KEY_V1=' + $key1) -replace '_APP_EXECUTOR_SECRET=your-secret-key', ('_APP_EXECUTOR_SECRET=' + $key2) | Set-Content .env"
    echo ✅ .env file created. Please update it with your secure values!
) else (
    echo ✅ .env file already exists
)

echo 📝 Creating cloudflared logs directory...
mkdir cloudflared\logs >nul 2>&1
type nul > cloudflared\logs\.gitkeep

echo ✅ Setup complete!
