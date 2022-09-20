#!/bin/bash

echo -e $Yellow "

  ||       || ||||||||      ||
  ||       || ||      ||    ||
  ||       || ||       ||   ||
  ||       || ||      ||    ||
  ||       || ||   ||       ||
  ||       || ||      ||    ||
  ||=======|| ||       ||   ||=========
  
  
  
  
  
  
  
  Shaharia

"

target=$1
printf "Total Targets: $(wc -l $1 | awk '{print $1}')\n"
mkdir -p output-urlplus
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Waybackurls Started\n"
cat $1 | xargs -P 100 -I X bash -c "echo 'X' | waybackurls > output-urlplus/waybackurls.txt > /dev/null"
printf "✅ Waybackurls data :$(wc -l output-urlplus/waybackurls.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Hakrawler Data Started\n"
cat $1 | hakrawler > output-urlplus/hakrawler.txt
printf "✅ hakrawler data :$(wc -l output-urlplus/hakrawler.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau Data Started\n"
cat $1 | gau --o output-urlplus/gau.txt
printf "✅ Gau data :$(wc -l output-urlplus/gau.txt | awk '{print $1}')\n"

cat output-urlplus/waybackurls.txt output-urlplus/hakrawler.txt output-urlplus/gau.txt | sort -u > output-urlplus/all-urls.txt

cat output-urlplus/all-urls.txt | httpx > output-urlplus/live-urls.txt

rm output-urlplus/all-urls.txt

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Total all-urls :$(wc -l output-urlplus/all-urls.txt)\n"
printf "Total live-urls :$(wc -l output-urlplus/live-urls.txt)\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Grep zip Started\n"
cat output-urlplus/live-urls.txt | grep ".zip" >output-urlplus/zip.txt
printf "✅ Zip data :$(wc -l output-urlplus/zip.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Grep csv Started\n"
cat output-urlplus/live-urls.txt | grep ".csv" >output-urlplus/csv.txt
printf "✅ Csv data :$(wc -l output-urlplus/csv.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep txt Started\n"
cat output-urlplus/live-urls.txt | grep ".txt" >output-urlplus/txt.txt
printf "✅ Txt data :$(wc -l output-urlplus/txt.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep xls Started\n"
cat output-urlplus/live-urls.txt | grep ".xls" >output-urlplus/xls.txt
printf "✅ Xls data :$(wc -l output-urlplus/xls.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep doc Started\n"
cat output-urlplus/live-urls.txt | grep ".doc" >output-urlplus/doc.txt
printf "✅ Doc data :$(wc -l output-urlplus/doc.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep pdf Started\n"
cat output-urlplus/live-urls.txt | grep ".pdf" >output-urlplus/pdf.txt
printf "✅ Pdf data :$(wc -l output-urlplus/pdf.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep php Started\n"
cat output-urlplus/live-urls.txt | grep ".php" >output-urlplus/php.txt
printf "✅ Php data :$(wc -l output-urlplus/php.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep asp Started\n"
cat output-urlplus/live-urls.txt | grep ".asp" >output-urlplus/asp.txt
printf "✅ Asp data :$(wc -l output-urlplus/asp.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep bak Started\n"
cat output-urlplus/live-urls.txt | grep ".bak" >output-urlplus/bak.txt
printf "✅ Bak data :$(wc -l output-urlplus/bak.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep env Started\n"
cat output-urlplus/live-urls.txt | grep ".env" >output-urlplus/env.txt
printf "✅ Env data :$(wc -l output-urlplus/env.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Grep api Started\n"
cat output-urlplus/live-urls.txt | grep "api" >output-urlplus/api.txt
printf "✅ Api data :$(wc -l output-urlplus/api.txt | awk '{print $1}')\n"
