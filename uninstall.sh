#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "🧹 Uninstalling tabgroup..."
bash ./tabgroup/uninstall.sh

echo "✅ tabgroup uninstalled."
