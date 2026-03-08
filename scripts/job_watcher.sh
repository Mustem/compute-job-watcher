#!/usr/bin/env bash

LOG_FILE="$1"
CUSTOM_KEYWORD="$2"

if [ -z "$LOG_FILE" ]; then
  echo "Usage: bash scripts/job_watcher.sh <log_file> [custom_keyword]"
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

if [ -n "$CUSTOM_KEYWORD" ]; then
  CUSTOM_COUNT=$(grep -i -c "$CUSTOM_KEYWORD" "$LOG_FILE")
  echo "- $CUSTOM_KEYWORD: $CUSTOM_COUNT"
fi

echo
echo "Watcher Status:"
if [ "$ERROR_COUNT" -gt 0 ] || [ "$FAILED_COUNT" -gt 0 ] || [ "$TIMEOUT_COUNT" -gt 0 ]; then
  echo "Warning: log contains failure-related events."
else
  echo "OK: no failure-related events detected."
fi
echo

echo "Last 20 lines:"
tail -n 20 "$LOG_FILE"
echo
