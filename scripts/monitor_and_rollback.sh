#!/usr/bin/env bash
set -euo pipefail

RESOURCE_GROUP="rg-lina-playground"
APP_NAME="app-mobilab-sandbox-8am3c"
SLOT_NAME="green"

PROD_URL="https://${APP_NAME}.azurewebsites.net/health.html"

echo "Monitoring production after deployment..."

for i in {1..6}; do
  echo "Check $i/6"

  if curl -fsS "$PROD_URL"; then
    echo "Production healthy"
  else
    echo "Production failed health check. Rolling back..."

    az webapp deployment slot swap \
      --resource-group "$RESOURCE_GROUP" \
      --name "$APP_NAME" \
      --slot "$SLOT_NAME" \
      --target-slot production

    echo "Rollback completed"
    exit 1
  fi

  sleep 10
done

echo "Monitoring completed. Production is stable."