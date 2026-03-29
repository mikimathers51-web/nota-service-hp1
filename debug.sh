#!/bin/bash

echo "=========================================="
echo "🐛 Debug Build & Install"
echo "=========================================="

# Build
npm run build
if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

# Sync
npx cap sync android

# Build APK
cd android
./gradlew assembleDebug
if [ $? -ne 0 ]; then
    echo "❌ APK build failed"
    exit 1
fi
cd ..

# Check device
echo "📱 Checking device..."
adb devices

DEVICE_COUNT=$(adb devices | grep -v "List" | grep "device$" | wc -l)

if [ "$DEVICE_COUNT" -eq "0" ]; then
    echo "⚠️  No device connected"
    echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"
    exit 0
fi

# Install
echo "📲 Installing..."
adb install -r android/app/build/outputs/apk/debug/app-debug.apk

if [ $? -eq 0 ]; then
    echo "✅ Installed!"
    adb shell am start -n com.notaservicehp.app/.MainActivity
else
    echo "❌ Install failed"
fi
