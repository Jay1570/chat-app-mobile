#!/usr/bin/env bash

set -e

flutter="/home/jay1570/development/flutter/bin/flutter"

STEP="Initializing"

trap 'echo "❌ Deployment failed at step: $STEP"; exit 1' ERR

WEB_ROOT="/var/www/chathub"

echo "🚀 Starting deployment..."

STEP="Clean build"
flutter clean

STEP="Build web"
flutter build web --release

STEP="Copy web files"
echo "📂 Copying web files..."
sudo mkdir -p "$WEB_ROOT"
rm -rf "$WEB_ROOT/*"
sudo cp -r build/web/. "$WEB_ROOT/"

STEP="Copy Nginx config"
echo "📄 Copying Nginx config..."
sudo cp nginx.conf /etc/nginx/conf.d/chathub.conf

STEP="Test Nginx config"
sudo nginx -t

STEP="Reload Nginx"
sudo systemctl reload nginx

echo "✅ Deployment completed!"
