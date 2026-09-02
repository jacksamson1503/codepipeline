#!/bin/bash
set -e

APP_DIR=/home/ubuntu/codepipeline-app
LOG_FILE=/home/ubuntu/codepipeline-app/app.log

cd "$APP_DIR"

# Stop the previous process if it exists
if [ -f "$APP_DIR/app.pid" ]; then
    OLD_PID=$(cat "$APP_DIR/app.pid" || true)
    if [ -n "$OLD_PID" ] && kill -0 "$OLD_PID" 2>/dev/null; then
        kill "$OLD_PID" || true
        sleep 2
    fi
fi

# Start the new application
nohup python3 app.py > "$LOG_FILE" 2>&1 &
echo $! > "$APP_DIR/app.pid"

echo "Application started with PID $(cat "$APP_DIR/app.pid")"
