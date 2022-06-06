#!/bin/bash

#by https://twitter.com/az7rb

if [ -z "$1" ]; then
  echo "[!] Usage: ./$0 username"
  echo ""
  exit 1
fi

echo "[+] Louding..."
echo ""

echo -e "[-] Researcher : $1"

#Country()

curl -s "https://app.intigriti.com/profile/$1" | grep "Country" | cut -d'>' -f11 | cut -d'<' -f1 | awk  '{print "[-] Country: "  $0}'

#Twitter()
	
curl -s "https://app.intigriti.com/profile/$1" | grep "Twitter" | cut -d'>' -f30 | cut -d '=' -f4 | cut -d '"' -f2 | awk  '{print "[-] Twitter: "  $0}'

#Rank()

curl -s "https://app.intigriti.com/profile/$1" | grep "Rank"| awk -F# '{print "[-] My Rank in Intigriti.com: "  $2}' | cut -d'<' -f1

#Streak()

curl -s "https://app.intigriti.com/profile/$1" | grep "streak" | cut -d'>' -f193 | sort | awk  '{print "[-] My streak Intigriti.com: "  $0}'| sed '2d'  | sed '3d' | sed '1d' | sort -u | uniq -u 


#days()
 
curl -s "https://app.intigriti.com/profile/$1" | grep "pts" | cut -d'>' -f179 | cut -d'<' -f1 | awk '{print "[-] My REP. 90 DAYS in Intigriti.com: "  $0}'

#all()

curl -s "https://app.intigriti.com/profile/$1" | grep "pts" | cut -d'>' -f169 | cut -d'<' -f1 | awk '{print "[-] My REP. ALL TIME in Intigriti.com: "  $0}'

echo ""
echo "[+] done..."
