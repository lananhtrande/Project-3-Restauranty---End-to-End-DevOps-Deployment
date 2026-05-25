#!/bin/bash

set -e

ACR=restaurantyacrlananh.azurecr.io
TAG=latest
PLATFORMS="linux/amd64,linux/arm64"

echo "Building auth..."

docker buildx build \
  --platform $PLATFORMS \
  -t $ACR/auth:$TAG \
  ./apps/backend/auth \
  --push

echo "Building discounts..."

docker buildx build \
  --platform $PLATFORMS \
  -t $ACR/discounts:$TAG \
  ./apps/backend/discounts \
  --push

echo "Building items..."

docker buildx build \
  --platform $PLATFORMS \
  -t $ACR/items:$TAG \
  ./apps/backend/items \
  --push

echo "Building client..."

docker buildx build \
  --platform $PLATFORMS \
  -t $ACR/client:$TAG \
  ./apps/client \
  --push

echo "Done."