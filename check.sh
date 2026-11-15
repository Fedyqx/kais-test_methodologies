#!/bin/bash
PASS=0
FAIL=0
LOG="$HOME/qa/test.log"

check() {
    local name="$1"
    shift
    if "$@" >/dev/null 2>&1; then
        echo "$(date '+%H:%M:%S') PASS: $name" | tee -a "$LOG"
        PASS=$((PASS + 1))
    else
        echo "$(date '+%H:%M:%S') FAIL: $name" | tee -a "$LOG"
        FAIL=$((FAIL + 1))
    fi
}