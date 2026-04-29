#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="rg-lina-playground"
APP_NAME="app-mobilab-sandbox-8am3c"
SLOT_NAME="green"

GREEN_HEALTH_URL="https://${APP_NAME}-${SLOT_NAME}.azurewebsites.net/health.html"
PROD_HEALTH_URL="https://${APP_NAME}.azurewebsites.net/health.html"

echo "Checking green slot health..."
if curl -fsS "$GREEN_HEALTH_URL"; then
  echo "Green slot is healthy. Swapping to production..."

  az webapp deployment slot swap \
    --resource-group "$RESOURCE_GROUP" \
    --name "$APP_NAME" \
    --slot "$SLOT_NAME" \
    --target-slot production

  echo "Checking production health after swap..."
  if curl -fsS "$PROD_HEALTH_URL"; then
    echo "Production is healthy. Deployment completed successfully."
  else
    echo "Production health check failed. Rolling back..."

    az webapp deployment slot swap \
      --resource-group "$RESOURCE_GROUP" \
      --name "$APP_NAME" \
      --slot "$SLOT_NAME" \
      --target-slot production

    echo "Rollback completed."
    exit 1
  fi
else
  echo "Green slot health check failed. Deployment stopped. No swap performed."
  exit 1
fi