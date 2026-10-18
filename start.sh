#!/usr/bin/env bash

# Sentinel Render.com Startup Script
set -e

# 1. Seed the database if it doesn't exist (Render uses ephemeral disks on free tier)
if [ ! -f "sentinel.db" ]; then
    echo "--- Initializing Synthetic SQLite Database ---"
    python scripts/seed_db.py 1000 5000 20000 0.002 0.0 normal normal
fi

# 2. Ensure market prices dataset exists
if [ ! -f "data/raw/prices.parquet" ]; then
    echo "--- Initializing Market Price Data ---"
    python -c "from sentinel.data.market import load_prices; load_prices()" || true
fi

# 3. Start the Uvicorn Server (Render uses the $PORT env variable)
echo "--- Starting Sentinel API ---"
uvicorn sentinel.api.main:app --host 0.0.0.0 --port ${PORT:-7860}
