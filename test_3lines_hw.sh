#!/bin/bash
source "$HOME/qa/check.sh"
check "Файл содержит ровно 3 строки" bash -c "[ \"\$(wc -l < $HOME/qa/data/users.csv)\" -eq 3 ]"
echo "Пройдено: $PASS, Провалено: $FAIL"