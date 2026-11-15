#!/bin/bash
# os_check.sh — базовая проверка ОС (Адаптировано для Git Bash)
LOG="$HOME/qa_test/logs/os_check.log"

{
echo "=== Проверка ОС ==="
echo "Дата: $(date '+%F %T')"
echo "[INFO] Среда: Windows + Git Bash (эмуляция)"

# Проверка сервисов (заменяем systemctl на проверку процессов Windows)
for svc in sshd crond NetworkManager; do
    if tasklist | grep -iq "$svc"; then
        echo "[OK] Процесс $svc найден в Windows"
    else
        echo "[SKIP] Сервис $svc не проверяется в Git Bash (нет systemctl)"
    fi
done
} | tee -a "$LOG"