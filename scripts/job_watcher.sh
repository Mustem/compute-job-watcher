#!/usr/bin/env bash

LOG_FILE="$1"

if [ -z "$LOG_FILE" ]; then
  echo "Usage: bash scripts/job_watcher.sh <log_file>"
  exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found: $LOG_FILE"
  exit 1
fi

echo "=== Compute Job Watcher ==="
echo
echo "Log file: $LOG_FILE"
echo

ERROR_COUNT=$(grep -i -c "error" "$LOG_FILE")
TIMEOUT_COUNT=$(grep -i -c "timeout" "$LOG_FILE")
SUCCESS_COUNT=$(grep -i -c "success" "$LOG_FILE")
CONNECTED_COUNT=$(grep -i -c "connected" "$LOG_FILE")
FAILED_COUNT=$(grep -i -c "failed" "$LOG_FILE")

echo "Summary:"
echo "- error: $ERROR_COUNT"
echo "- timeout: $TIMEOUT_COUNT"
echo "- success: $SUCCESS_COUNT"
echo "- connected: $CONNECTED_COUNT"
echo "- failed: $FAILED_COUNT"
echo

echo "Last 20 lines:"
tail -n 20 "$LOG_FILE"
echo
