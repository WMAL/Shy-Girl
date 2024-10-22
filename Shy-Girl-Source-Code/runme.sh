#!/bin/bash
#!!!!!***************!!!!!!!!!******************!!!!!!!!!!!!**********!
#Please read before making use of this code!
#Disclaimer: This is illegal if executed on real victims and could land you in prison for sure.
#This is intended for educational purposes only. We take no responsibility at all for your actions.
#This code is provided by EEEDS Eagle Eye Digital Security (Oman) for education purpose only.
#For more educational source codes please visit us http://www.digi77.com
#Author of this code W. Al Maawali Founder of  Eagle Eye Digital Solutions and Oman0.net can be reached via warith@digi77.com .

#Sharing knowledge is not about giving people something, or getting something from them.
#That is only valid for information sharing.
#Sharing knowledge occurs when people are genuinely interested in helping one another develop new capacities for action;
#it is about creating learning processes.
#Peter Senge
#!!!!!***************!!!!!!!!!******************!!!!!!!!!!!!**********!
clear
#### Functions
function gotoSleep(){
  	i=$timeinsec
	printf "Sleeping for $timeinsec seconds .."
	while [ $i -ge 1 ]
	do
	printf " --> $i"
	sleep 1
	i=`expr $i - 1`
	done
	
}

function printTaskNo()
{
       ((tasksInc++))
       echo
       echo "Running task number $tasksInc of $noTasks"
       

}

function printScreen()
{
       
       echo $1
       
}

function pause()
{
	echo   
	read -p "$*"
 
}


function pauseandsleep()
{
	
	if [ $beepme -eq 1 ]; then
		cd $basedir 
		play -q 1.wav
	fi


	if [ $pausme -eq 1 ]; then
		gotoSleep
		
	fi
        if [ $stopme -eq 1 ]; then
		 
		pause 'Press [Enter] key to continue...'
	fi

    cd $basedir
    printScreen ""
}

### end functions


# Missing packages installation


printScreen ""
printScreen ""

if !(dpkg --list geoip-bin | egrep -q ^ii); then
	printScreen ""
	printScreen ""   
 	printScreen "Ops.. geoip-bin package is missing we we will try to install it for you if it does not work please use this command $sudo apt-get -y install geoip-bin"
	printScreen ""
	printScreen ""
    sudo apt-get -y install geoip-bin
fi


if !(dpkg --list expect-dev | egrep -q ^ii); then
	printScreen ""
	printScreen ""   
 	printScreen "Ops.. expect-dev package is missing we we will try to install it for you if it does not work please use this command $sudo apt-get -y install expect-dev"
	printScreen ""
	printScreen ""
    sudo apt-get -y install expect-dev
fi


if !(dpkg --list fierce | egrep -q ^ii); then
	printScreen ""
	printScreen ""   
 	printScreen "Ops.. fierce package is missing we we will try to install it for you if it does not work please use this command $sudo apt-get -y install fierce"
	printScreen ""
	printScreen ""
    sudo apt-get -y install fierce
fi


if !(dpkg --list timeout | egrep -q ^ii); then
	printScreen ""
	printScreen ""   
 	printScreen "Ops.. timeout package is missing we we will try to install it for you if it does not work please use this command $sudo apt-get -y install timeout"
	printScreen ""
	printScreen ""
    sudo apt-get -y install timeout
fi



printScreen ""
printScreen ""
printScreen ""
printScreen ""
# end Missing packages installation
 
#set number of tasks
noTasks=17;
# task increment var
tasksInc=0;
#set your tools dir here
basedir="/root/Desktop/shygirl"
pausme=0
stopme=0
timeinsec=0
domain="myexample.com"
beepme=0

#set script run time timeout ...(3600 seconds is thedefault = 1 hour)
scTimeout=3600 

# detect empty arguments
if [ $# -eq 0 ]; then
	printScreen ""
	printScreen ""	
	printScreen "No parameters were passed to the script!!!" 
	printScreen ""
	printScreen "usage: $. runme.sh [-s] [-b] [-p seconds] [-d domain name]"
        printScreen "-s for stop | -b for beep sound | -p for pause | -d fordomain"
        printScreen ""
	printScreen "Example(1) get info for the domain yahoo.com but do not pause or stop between tasks and redirect all outputs to a file called results.txt"
	printScreen "$. runme.sh -d yahoo.com >> results.txt"
	printScreen ""	
	printScreen "Example(2) get info for the domain yahoo.com and stop between tasks "
	printScreen "$. runme.sh -s -d yahoo.com "
	printScreen ""	
	printScreen "Example(3) get info for the domain yahoo.com and pause for 15 seconds between tasks "
	printScreen "$. runme.sh -p 15 -d yahoo.com"
	printScreen ""	
	printScreen "Example(4) get info for the domain yahoo.com and pause for 10 seconds and stop between tasks "
	printScreen "$. runme.sh -s -p 10 -d yahoo.com"
        printScreen ""	
	printScreen "Example(5) get info for the domain yahoo.com and pause for 4 seconds and stop between tasks + beep sound when a task is completed"
	printScreen "$. runme.sh -s -b -p 4 -d yahoo.com"
	pause 'Press [Enter] key to exit...or Ctrl c to quit the script and run it again correctly'	
        exit 1
fi


# Accept command line arguments
while [ $# -gt 0 ]
do
    case "$1" in
        -s)  stopme=1;;
 	-b)  beepme=1 ;;
	-p)  pausme=1 timeinsec=$2; shift;;
        -d)  domain=$2 ; shift;;       
	--)	shift; break;;
	-*)
	    echo >&2 \
	    "usage: $0 [-v] [-f file] [file ...]"
	    exit 1;;
	*)  break;;	# terminate while loop
    esac
    shift
done

 
printScreen  "---------------------------------------------------------------------------------------------------------------------------------"
printScreen "@shy girl@"
printScreen "Shy girl is written by Warith AL Maawali  (c) 2012-2013 Founder of Eagle Eye Digital Solutions" 
printScreen "I made sure she is shy enough not to be detected :) "
printScreen "http://www.digi77.com"  
printScreen "http://www.oman0.net"
printScreen "Script v 0.3"
printScreen "Thank you To Lee Baird for sharing ideas , Joe McCray for your woudnerfull class (Hacker Halted Asia 2012), and Jafer Alzidjali for the valuable feedback"
printScreen "This script was tested on Backtrack5 R3 in case you face any path related errors"
printScreen "This script will perform various reconnaissance on your target. If you have good ideas please send them to me warith@digi77.com "
printScreen  "---------------------------------------------------------------------------------------------------------------------------------"
printScreen ""
printScreen "We will be running $noTasks tasks" 
printScreen "Base tools dir is $basedir"
printScreen "All commands timeout are set to $scTimeout seconds"
printScreen "Script starts here -:-:-:-:-:-:-:- "
printScreen ""




: << COMMENT  
# for long comments 
COMMENT



printScreen "###########################################################################################"
printTaskNo
printScreen "List of IP addresses to web servers that are linked from $domain:"
timeout $scTimeout wget www.$domain -q
grep "href=" index.html | cut -d "/" -f3 | grep $domain | cut -d '"' -f1 | sort -u > $domain-servers.txt
for x in $(cat $domain-servers.txt);do
	host $x | grep "has address" | cut -d " " -f4 >> $domain-ips.txt
done
cat $domain-ips.txt | sort -u > $domain.txt
rm index.html
rm $domain-servers.txt
rm $domain-ips.txt
cat $domain.txt
rm $domain.txt
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Getting hosting country for $domain:" 
# If you get an error run this command $apt-get install geoip-bin
timeout $scTimeout geoiplookup $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen " "
printScreen "Getting whois info for $domain"
((timeout $scTimeout whois $domain |grep -B 9 "Expiration"  ) && (timeout $scTimeout whois $domain |grep -A 4 -i "Registrant:"  ) && (timeout $scTimeout whois $domain |grep -A 50 -i "Administrative Contact"  ))
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Gathter $domain  from various public sources"
cd /pentest/enumeration/theharvester
timeout $scTimeout python theHarvester.py -d $domain -b all
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "dig info on ===> dig   $domain  any"
timeout $scTimeout dig $domain any
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen 
printScreen  "Get host inf ==> host -l $domain" 
printScreen ""
timeout $scTimeout host -l -v $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Get tracerout ===> tcptraceroute   $domain"
printScreen ""
timeout $scTimeout tcptraceroute $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "dns bruteforec  ===> cd /pentest/enumeration/dns/dnsenum"
printScreen "perl dnsenum.pl --enum -f dns.txt --update a -r  $domain"
printScreen ""
cd /pentest/enumeration/dns/dnsenum
timeout $scTimeout perl dnsenum.pl --enum -f dns.txt --update a -r $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "dnstracer $domain"
printScreen ""
timeout $scTimeout dnstracer $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
# If you get errors install it from here  http://trac.assembla.com/fierce/wiki/Installing
# to update just run $svn update 
printScreen ""
printScreen "dns bruteforec  ===> cd /pentest/enumeration/dns/fierce/"
printScreen "fierce -dns  $domain"
printScreen ""
cd "/pentest/enumeration/dns/fierce/"
timeout $scTimeout perl fierce.pl -dns $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "dns bruteforec blindcrawl  ===> cd $basedir"
printScreen "perl blindcrawl.pl -d $domain"
printScreen ""
timeout $scTimeout perl blindcrawl.pl -d $domain
printScreen " "
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
echo "dns bruteforec gxfr.py  ===> cd $basedir"
echo "python gxfr.py --both --dns-lookup -v -z" $domain
printScreen ""
timeout $scTimeout python gxfr.py --both --dns-lookup -v -z $domain
printScreen ""
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Find virtual hostings  or use bing.com  ip:ip address  ===> cd $basedir"
printScreen "perl RitX.pl -t  $domain"
printScreen ""
timeout $scTimeout perl RitX.pl -t $domain
printScreen ""
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Checks if a given domain uses load-balancing =====> cd /pentest/enumeration/web/lbd"
printScreen "./lbd.sh  $domain"
cd /pentest/enumeration/web/lbd
timeout $scTimeout ./lbd.sh $domain
printScreen ""
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Web Application Firewall Detection Tool =====> cd /pentest/web/waffit"
printScreen "python wafw00f.py http://www.$domain"
cd /pentest/web/waffit
timeout $scTimeout python wafw00f.py "http://www.$domain"  
printScreen ""
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Website Detection Tool =====> cd /pentest/enumeration/web/webshag"
cd /pentest/enumeration/web/webshag
printScreen "python webshag_cli.py -m uscan $domain"
timeout $scTimeout unbuffer python webshag_cli.py -m uscan $domain | grep -v "overloaded"
printScreen ""
printScreen "python webshag_cli.py -m spider $domain"
timeout $scTimeout unbuffer python webshag_cli.py -m spider $domain | grep -v "overloaded"
printScreen ""
# You need to install apt-get -y install expect-dev for unbuffer to work
printScreen "python webshag_cli.py -e 10 -m fuzz $domain"
timeout $scTimeout unbuffer python webshag_cli.py -e 10 -m fuzz $domain | grep -v "overloaded"
printScreen ""
pauseandsleep
printScreen "###########################################################################################"
printTaskNo
printScreen ""
printScreen "Getting host ip then we do a ping sweep"
timeout $scTimeout nslookup $domain
printScreen ""
printScreen "Now ping sweeping the ip range...."
timeout $scTimeout nmap -sL "$domain/24" | grep "("
printScreen ""
printScreen "Now nmap the domain $domain for open ports in stealth mode"
timeout $scTimeout nmap -F -sS -Pn -P0 "$domain"  
printScreen "###########################################################################################"
printScreen ""
cd $basedir
rm -f -r "$basedir/tmp"
printScreen "%%%%%%%% End Of Script %%%%%%%%"