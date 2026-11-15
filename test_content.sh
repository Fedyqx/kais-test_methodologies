#!/bin/bash
source "$HOME/qa/check.sh"
check "В файле есть заголовок 'id,name,status'" grep -q "id,name,status" "$HOME/qa/data/users.csv"
echo "Пройдено: $PASS, Провалено: $FAIL"