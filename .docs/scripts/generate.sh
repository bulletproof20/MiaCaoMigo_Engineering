#!/bin/bash

# =============================================================================
# MiaCaoMigo Engineering - SchemaSpy Documentation Generator (for Linux/macOS)
# =============================================================================
#
# This script uses the official SchemaSpy Docker image to connect to the
# running PostgreSQL database, analyze its schema, and generate interactive
# HTML documentation.
#
# Prerequisites:
#   - Docker must be installed and running.
#   - The PostgreSQL database container must be running.
#
# Usage:
#   From the root of the 'MiaCaoMigo_Engineering' repository, run:
#   ./.docs/schemaspy/generate.sh
#
# =============================================================================

# --- Configuration ---
# Adjust these variables if your local database setup is different.
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="miacaomigo"
DB_USER="postgres"
DB_PASS="1234" 

# This is the relative path from the repository root to the output folder.
OUTPUT_DIR="./04_Architecture/01_Database/05_SchemaSpy/02_Output"

# --- Docker Execution ---
echo "Starting SchemaSpy documentation generation..."

docker run --rm --network="host" \
  -v "${OUTPUT_DIR}:/output" \
  schemaspy/schemaspy:latest \
  -t pgsql -host "${DB_HOST}" -port "${DB_PORT}" -db "${DB_NAME}" -u "${DB_USER}" -p "${DB_PASS}" -o /output

echo "SchemaSpy documentation generated successfully in ${OUTPUT_DIR}"
