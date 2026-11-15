#!/bin/bash
source ~/logs_test/check.sh
CONF=~/config_test/app.conf

check "Конфиг существует"          test -s "$CONF"
check "Секция [server] есть"       grep -q "^\[server\]" "$CONF"
check "Секция [database] есть"     grep -q "^\[database\]" "$CONF"
check "Порт сервера = 8080"        grep -q "^port=8080" "$CONF"
check "Уровень логирования INFO"   grep -q "^level=INFO" "$CONF"
check "Путь к логу абсолютный"     grep -q "^file=/var/log" "$CONF"
check "Нет пустых значений"        bash -c "! grep -qE '^[a-z]+=$' $CONF"

echo "Пройдено: $PASS, Провалено: $FAIL"

