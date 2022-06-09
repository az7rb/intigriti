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

#Streak()

curl -s "https://app.intigriti.com/profile/$1" | grep "streak" | cut -d'>' -f177 | awk  '{print "[-] My streak Intigriti.com: "  $0}'  | sort -u | sed '1d'


#RankALL()

curl -s "https://app.intigriti.com/profile/$1" | grep "Rank" | awk -F# '{print "[-] My Rank ALL TIME in Intigriti.com: "  $2}' | cut -d '<' -f1

#RankDAYS()

curl -s "https://app.intigriti.com/leaderboard?ninetydays=true&severity=1" | egrep "/profile/$1"  | cut -d '"' -f9 | cut -d '<' -f1 | cut -d '>' -f2 | awk -F# '{print "[-] My Rank 90 DAYS in Intigriti.com: "  $0}'


#days()
 
curl -s "https://app.intigriti.com/profile/$1" | grep "pts" | cut -d'>' -f163 | cut -d'<' -f1 | awk '{print "[-] My REP. 90 DAYS in Intigriti.com: "  $0}'

#all()

curl -s "https://app.intigriti.com/profile/$1" | grep "pts" | cut -d'>' -f153 | cut -d'<' -f1 | awk '{print "[-] My REP. ALL TIME in Intigriti.com: "  $0}'

echo ""
echo "[+] done..."
