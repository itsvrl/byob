#/bin/sh
# Build Docker images
CURRENT_DIR="$(pwd)"
echo "Building Docker images - this will take a while, please be patient..."
echo ""
cd $CURRENT_DIR/web-gui/docker-pyinstaller \
; docker build -f Dockerfile-py3-amd64 -t nix-amd64 . \
; docker build -f Dockerfile-py3-i386 -t nix-i386 .  \
; docker build -f Dockerfile-py3-win32 -t win-x32 .
# Run app
cd $CURRENT_DIR/web-gui
echo "BYOB WebGUI should now be available on: $HOSTNAME.local:5000"
python3 run.py