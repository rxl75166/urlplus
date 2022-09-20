#!/bin/bash

echo -e $Yellow "


           Imran & Shaharia

"

target=$1
printf "Total Targets: $(wc -l $1 | awk '{print $1}')\n"
mkdir -p output-urlplus
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Waybackurls Started\n"
cat $1 | xargs -P 100 -I X bash -c "echo 'X' | waybackurls > output-urlplus/waybackurls.txt > /dev/null"
printf "✅ Waybackurls data :$(wc -l output-urlplus/waybackurls.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Hawrawler Data Started\n"
cat $1 | hakrawler > output-urlplus/hakrawler.txt
printf "✅ hakrawler data :$(wc -l output-urlplus/hakrawler.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau Data Started\n"
cat $1 | gau --o output-urlplus/gau.txt
printf "✅ Gau data :$(wc -l output-urlplus/gau.txt | awk '{print $1}')\n"

cat output-urlplus/waybackurls.txt output-urlplus/hakrawler.txt output-urlplus/gau.txt | sort -u > output-urlplus/all-urls.txt

cat output-urlplus/all-urls.txt | httpx > output-urlplus/live-urls.txt

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
