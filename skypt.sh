#!/bin/bash

while [ $# -gt 0 ]; do
  case "$1" in
    --date)
      date=$(date +"%Y-%m-%d")
      echo "Dzisiejsza data to: $date"
      exit 0
      ;;
    --logs)
      if [[ "$2" =~ ^[0-9]+$ ]]; then
        num_logs=$2
      else
        num_logs=100
      fi
      for (( i=1; i<=$num_logs; i++ )); do
        echo "To jest plik log$i.txt, utworzony przez skrypt $0 w dniu $(date +"%Y-%m-%d")" > log$i.txt
      done
      exit 0
      ;;
    --help)
      echo "Użycie: $0 [OPCJA]"
      echo "  --date           Wyświetla dzisiejszą datę"
      echo "  --logs [LICZBA]  Tworzy 100 plików logx.txt lub określoną przez LICZBA liczbę plików z informacją o nazwie pliku, skrypcie i dacie"
      echo "  --help           Wyświetla pomoc"
      exit 0
      ;;
    *)
      echo "Nieznana opcja: $1. Użyj --help, aby wyświetlić dostępne opcje."
      exit 1
      ;;
  esac
done

echo "Nie podano żadnej opcji. Użyj --help, aby wyświetlić dostępne opcje."
exit 1