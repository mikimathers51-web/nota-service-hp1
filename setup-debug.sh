#!/bin/bash

echo "=========================================="
echo "🚀 Setup Nota Service HP - Android Debug"
echo "=========================================="

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check prerequisites
echo "🔍 Checking prerequisites..."

if ! command -v node &> /dev/null; then
    echo "${RED}❌ Node.js tidak ditemukan${NC}"
    exit 1
fi
echo "✅ Node.js: $(node -v)"

if ! command -v java &> /dev/null; then
    echo "${RED}❌ Java tidak ditemukan${NC}"
    exit 1
fi
echo "✅ Java: $(java -version 2>&1 | head -n 1)"

# Check HTML file
if [ ! -f "src/index.html" ]; then
    echo "${YELLOW}⚠️  src/index.html tidak ditemukan!${NC}"
    echo "   Silakan tambahkan file HTML Anda ke: src/index.html"
    mkdir -p src
    exit 1
fi

echo "✅ src/index.html ditemukan"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Prepare www
mkdir -p www
cp src/index.html www/index.html

# Add Android platform
echo ""
echo "🤖 Setting up Android..."
if [ -d "android" ]; then
    echo "✅ Android platform sudah ada"
else
    npx cap add android
fi

# Sync
npx cap sync android

echo ""
echo "=========================================="
echo "${GREEN}✅ Setup complete!${NC}"
echo "=========================================="
echo ""
echo "Commands:"
echo "  npm run build:debug    → Build APK"
echo "  npm run cap:open       → Buka Android Studio"
echo ""
