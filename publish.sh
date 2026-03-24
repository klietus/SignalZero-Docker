#!/bin/bash

# Configuration
DOCKER_USER="klietus"
NODE_IMAGE="signalzero-node"
CHAT_IMAGE="signalzero-chat"
VOICE_IMAGE="signalzero-voice"
VERSION="2.1.0"

echo "🚀 Starting SignalZero Publication Process (v$VERSION)..."

# 1. Build and Tag Node (Backend)
echo "📦 Building $NODE_IMAGE..."
docker build -t $DOCKER_USER/$NODE_IMAGE:latest -t $DOCKER_USER/$NODE_IMAGE:$VERSION ../SignalZero-LocalNode

# 2. Build and Tag Chat (Frontend)
echo "📦 Building $CHAT_IMAGE..."
docker build -t $DOCKER_USER/$CHAT_IMAGE:latest -t $DOCKER_USER/$CHAT_IMAGE:$VERSION ../SignalZero-LocalChat

# 3. Build and Tag Voice Service
echo "📦 Building $VOICE_IMAGE..."
docker build -t $DOCKER_USER/$VOICE_IMAGE:latest -t $DOCKER_USER/$VOICE_IMAGE:$VERSION ../SignalZero-VoiceService

# 4. Push to Docker Hub
echo "☁️ Pushing to Docker Hub..."
docker push $DOCKER_USER/$NODE_IMAGE:latest
docker push $DOCKER_USER/$NODE_IMAGE:$VERSION
docker push $DOCKER_USER/$CHAT_IMAGE:latest
docker push $DOCKER_USER/$CHAT_IMAGE:$VERSION
docker push $DOCKER_USER/$VOICE_IMAGE:latest
docker push $DOCKER_USER/$VOICE_IMAGE:$VERSION

echo "✅ Publication complete!"
echo "Users can now run your app using: docker-compose -f docker-compose.release.yml up"
