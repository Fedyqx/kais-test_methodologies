#!/bin/bash
for test in "$HOME/qa"/test_*.sh; do
    echo "--- $(basename "$test") ---"
    bash "$test"
done