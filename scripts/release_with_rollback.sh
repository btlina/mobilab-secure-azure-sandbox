#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="rg-lina-playground"
APP_NAME="app-mobilab-sandbox-8am3c"
SLOT_NAME="green"

GREEN_URL="https://${APP_NAME}-${SLOT_NAME}.azurewebsites.net"
PROD_URL="https://${APP_NAME}.azurewebsites.net"

echo "Checking green slot health..."

if curl -fsS "${GREEN_URL}/health.html"; then
  echo "Green slot healthy."
else
  echo "Green slot failed health check. Deployment stopped."
  exit 1
fi

echo "Swapping green to production..."

az webapp deployment slot swap \
  --resource-group "$RESOURCE_GROUP" \
  --name "$APP_NAME" \
  --slot "$SLOT_NAME" \
  --target-slot production

echo "Waiting for production to warm up..."
sleep 20

echo "Checking production health..."

if curl -fsS "${PROD_URL}/health.html"; then
  echo "Production healthy. Release successful."
else
  echo "Production failed health check. Rolling back..."

  az webapp deployment slot swap \
    --resource-group "$RESOURCE_GROUP" \
    --name "$APP_NAME" \
    --slot "$SLOT_NAME" \
    --target-slot production

  echo "Rollback completed. Previous version restored."
  exit 1
fi