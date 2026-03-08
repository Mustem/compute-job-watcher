# compute-job-watcher

A small Bash utility to inspect compute or node job logs and summarize common events.

## Features

- Reads a target log file
- Counts common log events
- Uses case-insensitive matching
- Shows a quick watcher status
- Shows the last 20 lines
- Supports an optional custom keyword
- Gives a simple summary for operator workflows

## Structure

- scripts/ -> watcher scripts
- docs/ -> usage notes
- examples/ -> sample input and output
- logs/ -> local test logs

## Main Script

### job_watcher.sh
Checks a log file for common status keywords:
- error
- timeout
- success
- connected
- failed

It can also count an optional custom keyword.

## Usage

Run:
bash scripts/job_watcher.sh examples/sample-log.txt

Run with a custom keyword:
bash scripts/job_watcher.sh examples/sample-log.txt worker

## Roadmap

- Add output export
- Add summary-only mode
- Add custom warning thresholds
