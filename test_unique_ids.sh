#!/bin/bash
source "$HOME/qa/check.sh"
check "ID в CSV уникальны" bash -c "! cut -d',' -f1 $HOME/qa/data/users.csv | tail -n +2 | sort | uniq -d | grep -q ."
echo "Пройдено: $PASS, Провалено: $FAIL"