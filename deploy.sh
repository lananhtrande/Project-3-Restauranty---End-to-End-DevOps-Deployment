#!/bin/bash

set -e

DOCKER_USER="lananh03"
TAG="latest"
PLATFORMS="linux/amd64,linux/arm64"

echo "Logging Docker info..."
docker info >/dev/null

echo "Creating buildx builder if needed..."
docker buildx create --name multi-builder --use 2>/dev/null || true
docker buildx inspect --bootstrap

echo "Building and pushing AUTH..."
docker buildx build \
  --platform $PLATFORMS \
  -t ${DOCKER_USER}/restauranty-auth:${TAG} \
  ./backend/auth \
  --push

echo "Building and pushing DISCOUNTS..."
docker buildx build \
  --platform $PLATFORMS \
  -t ${DOCKER_USER}/restauranty-discounts:${TAG} \
  ./backend/discounts \
  --push

echo "Building and pushing ITEMS..."
docker buildx build \
  --platform $PLATFORMS \
  -t ${DOCKER_USER}/restauranty-items:${TAG} \
  ./backend/items \
  --push

echo "Building and pushing CLIENT..."
docker buildx build \
  --platform $PLATFORMS \
  -t ${DOCKER_USER}/restauranty-client:${TAG} \
  ./client \
  --push

echo "Building and pushing HAPROXY..."
docker buildx build \
  --platform $PLATFORMS \
  -t ${DOCKER_USER}/restauranty-haproxy:${TAG} \
  ./haproxy \
  --push

echo "Starting containers..."

docker-compose up -d

echo "Deployment complete."