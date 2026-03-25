#!/usr/bin/env bash
# LCCN Harvester — Linux / macOS launch script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Activate virtual environment if it exists
if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
fi

# Prefer python3, fall back to python
if command -v python3 &>/dev/null; then
    PYTHON=python3
elif command -v python &>/dev/null; then
    PYTHON=python
else
    echo "Error: Python not found. Please install Python 3.11 or higher."
    exit 1
fi

# Check Python version
PY_VERSION=$($PYTHON -c "import sys; print(sys.version_info.major * 10 + sys.version_info.minor)")
if [ "$PY_VERSION" -lt 311 ]; then
    echo "Error: Python 3.11 or higher is required."
    exit 1
fi

exec $PYTHON app_entry.py "$@"
