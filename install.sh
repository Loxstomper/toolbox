#!/bin/bash
set -e

# Change to the directory of this script
cd "$(dirname "$0")"

echo "🔧 Installing tabgroup..."
bash ./tabgroup/install.sh

echo "✅ tabgroup installed."

