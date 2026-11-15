#!/bin/bash
source "$HOME/qa/check.sh"
check "Каталог logs существует" test -d "$HOME/qa/logs"
echo "Пройдено: $PASS, Провалено: $FAIL"