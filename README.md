# compute-job-watcher

A small Bash utility to inspect compute or node job logs and summarize common events.

## Features

- Reads a target log file
- Counts common log events
- Uses case-insensitive matching
- Shows the last 20 lines
- Gives a quick summary for operator workflows

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

## Usage

Run:
bash scripts/job_watcher.sh examples/sample-log.txt

## Roadmap

- Add output export
- Add warning summary mode
- Add custom keyword support
