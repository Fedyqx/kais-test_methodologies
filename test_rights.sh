#!/bin/bash
source "$HOME/qa/check.sh"
check "Файл users.csv доступен для чтения" test -r "$HOME/qa/data/users.csv"
echo "Пройдено: $PASS, Провалено: $FAIL"