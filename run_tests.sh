#!/bin/bash
PASS=0
FAIL=0
LOG_FILE="$HOME/qa_test/logs/test_$(date +%Y-%m-%d_%H-%M-%S).log"
HOST="localhost"
PORT="8080"
URL="http://$HOST:$PORT/users.csv"

log() {
    echo "[$(date '+%H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

check() {
    local name="$1"
    shift
    if "$@" >/dev/null 2>&1; then
        log "PASS: $name"
        PASS=$((PASS + 1))
    else
        log "FAIL: $name"
        FAIL=$((FAIL + 1))
    fi
}

log "===== Старт тестирования ИС ====="

check "HTTP-сервер доступен на порту $PORT" \
    bash -c "curl -s -o /dev/null --max-time 3 $URL"

check "HTTP-код ответа = 200" \
    bash -c "[ \"\$(curl -s -o /dev/null -w '%{http_code}' $URL)\" = '200' ]"

check "Ответ содержит заголовок 'id,name,status'" \
    bash -c "curl -s $URL | grep -q 'id,name,status'"

check "Файл users.csv существует и не пуст" \
    test -s "$HOME/qa_test/data/users.csv"

check "Файл users.csv содержит 3 строки" \
    bash -c "[ \"\$(wc -l < $HOME/qa_test/data/users.csv)\" -eq 3 ]"

check "Процесс python3 http.server запущен" \
    pgrep -f "http.server 8080"

check "Порт $PORT слушается" \
    bash -c "timeout 2 bash -c '</dev/tcp/$HOST/$PORT'"

check "Файл users.csv доступен для чтения" \
    test -r "$HOME/qa_test/data/users.csv"

check "В данных есть запись 'Ivan'" \
    bash -c "curl -s $URL | grep -q 'Ivan'"

check "Ответ не содержит слова 'error'" \
    bash -c "! curl -s $URL | grep -qi 'error'"

log "===== Результаты ====="
log "Пройдено: $PASS"
log "Провалено: $FAIL"
log "Лог сохранён: $LOG_FILE"

if [ "$FAIL" -eq 0 ]; then
    log "ИТОГ: Все тесты пройдены успешно!"
    exit 0
else
    log "ИТОГ: Есть проваленные тесты!"
    exit 1
fi