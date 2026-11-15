#!/bin/bash
source "$HOME/qa/check.sh"
check "Каталог logs доступен для записи" test -w "$HOME/qa/logs"
echo "Пройдено: $PASS, Провалено: $FAIL"