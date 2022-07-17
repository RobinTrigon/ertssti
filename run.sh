
#!/bin/bash
#BISMILLAH
#3rr0r-404 | RobinTrigon
#ssti
function banner(){
echo -e '''\033[1;38;5;013m
╔═╗  ╦═╗  ╔╦╗  ╔═╗  ╔═╗  ╔╦╗  ╦  
║╣   ╠╦╝   ║   ╚═╗  ╚═╗   ║   ║  
╚═╝  ╩╚═   ╩   ╚═╝  ╚═╝   ╩   ╩  simple ssti scanner.
'''
                             echo -e "                       \033[1;38;5;051m  \e[5mRobinTrigon | 3rr0r-404"
echo -e "\033[0m"
}


function menu(){
echo -e " Select Which Type of scan U want to perform."
echo -e " [1] Single url:"
echo -e " [2] Multiple url:"
echo -e " [3] Exit"
read Type
if [ $Type -eq 1 ]; then
 Single
elif [ $Type -eq 2 ]; then
multi
elif [ $Type -eq 3 ]; then
exit
fi

}


function Single(){

	echo -e -n " [*] Enter your url:"
	read url
echo -e "\n\033[1;38;5;154m [+] S C A N N I N G.."
for j in $(cat core/pay); do
echo "$url" | qsreplace "$j"|tee -a temp
done
for k in $(cat temp);do
	echo "$k" | xargs -P30 -n1 curl -s -m5 |grep "tr10n" &>/dev/null && echo "$k" | tee -a temp1
done
clear
banner
cat temp1 | sort -u | tamu url
echo -e " "
rm temp
rm temp1
}



function multi(){

	echo -e -n " [*] Enter your url list:"
	read url
echo -e "\n\033[1;38;5;154m [+] SSTI SCANNING.."
for i in $(cat $url ); do
for j in $(cat core/pay); do

echo "$i" | qsreplace "$j" | tee -a temp1
done
done
for k in $(cat temp1);do
	echo "$k" | xargs -P30 -n1 curl -s -m5|grep "tr10n" &>/dev/null && echo -e "$k" | tee -a temp2
done
clear
banner
cat temp2|sort -u | tamu url|sort -u >>result.txt
echo -e " V L U N E A R E H E R E..."
cat result.txt
echo -e " "
echo -e " \033[1;38;5;196m[+] \033[1;38;5;040m result save into \033[1;38;5;154m'result.txt' file ! "

rm temp1;rm temp2
}

clear
echo " "
echo ''[✗]─[root@Trigon]─[ pwd ]''
pwd
echo ''[✗]─[root@Trigon]─[ ls ]''
ls
echo ''[✗]─[root@Trigon]─[~]''

banner
menu
