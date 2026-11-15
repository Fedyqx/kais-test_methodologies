#!/bin/bash
source "$HOME/qa/check.sh"
check "В CSV ровно 3 поля" bash -c "[ \"\$(awk -F',' 'NR==1{print NF}' $HOME/qa/data/users.csv)\" -eq 3 ]"
echo "Пройдено: $PASS, Провалено: $FAIL"