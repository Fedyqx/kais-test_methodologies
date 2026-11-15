#!/bin/bash
# integrity_check.sh — проверка прав (адаптировано для Windows)
LOG="$HOME/qa_test/logs/integrity.log"
echo "=== Проверка конфигураций ===" | tee -a "$LOG"

# В Git Bash путь /etc эмулируется. Проверим файлы в текущей папке.
echo "--- Поиск файлов с правами 777 (в папке qa_test) ---" | tee -a "$LOG"
find "$HOME/qa_test" -maxdepth 2 -type f -perm -o+w 2>/dev/null | tee -a "$LOG"

echo "--- Хэши ключевых файлов (эмуляция /etc) ---" | tee -a "$LOG"
for f in /etc/passwd /etc/group /etc/hosts; do
    [ -f "$f" ] && sha256sum "$f" | tee -a "$LOG" || echo "[SKIP] $f не найден" | tee -a "$LOG"
done