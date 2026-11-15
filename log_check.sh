#!/bin/bash
# log_check.sh — анализ журналов (адаптировано)
LOG="$HOME/qa_test/logs/log_check.log"
echo "=== Анализ журналов ===" | tee -a "$LOG"

echo "--- [SKIP] journalctl недоступен в Git Bash (нет systemd) ---" | tee -a "$LOG"
echo "--- [SKIP] /var/log/secure недоступен в Git Bash ---" | tee -a "$LOG"

echo "--- Размеры файлов в нашей папке logs ---" | tee -a "$LOG"
du -sh "$HOME/qa_test/logs/"* 2>/dev/null | sort -rh | head -5 | tee -a "$LOG"