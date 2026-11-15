#!/bin/bash
source "$HOME/qa/check.sh"
check "Файл users.csv существует и не пуст" test -s "$HOME/qa/data/users.csv"
echo "Пройдено: $PASS, Провалено: $FAIL"