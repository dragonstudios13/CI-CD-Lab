#!/bin/bash
echo "Stopping any existing deployment..."
pkill -f "http-server" || true

echo "Copying files to deployment folder..."
rm -rf deployed_app
cp -r src deployed_app

echo "Starting new deployment on port 8081..."
nohup npx http-server deployed_app -p 8081 > deploy.log 2>&1 &

echo "Deployment successful! Visit http://localhost:8081"
