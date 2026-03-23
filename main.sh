#!/bin/bash

# ---------------------------------------------
# Render initialization and FastAPI startup script
# ---------------------------------------------

# Exit immediately if a command exits with a non-zero status
set -e

# Update package lists and install system dependencies (optional, if needed)
echo "Updating system packages..."
apt-get update -y
apt-get install -y python3 python3-pip python3-venv

# Create a virtual environment (if not already created)
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install Python dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip install -r requirements.txt
else
    echo "requirements.txt not found, skipping..."
fi

# Optional: install Uvicorn if not in requirements
pip install uvicorn

# Run the FastAPI app
# Assumes your FastAPI app is in main.py and the FastAPI instance is named "app"
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 10000