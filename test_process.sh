#!/bin/bash
source "$HOME/qa/check.sh"
check "Процесс python http.server запущен" bash -c "tasklist | grep -iq 'python'"
echo "Пройдено: $PASS, Провалено: $FAIL"