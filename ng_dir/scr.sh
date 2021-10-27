#/bin/sh
for ((;;)) 
	do
	for (( c=0; c<5; c++ ))
	do
		repl=$(mpstat)
		> /usr/share/nginx/html/cpu.html
		echo "<!DOCTYPE html><html><head><meta http-equiv="refresh" content="1"><head/><body>" >> /usr/share/nginx/html/cpu.html
		echo $repl >> /usr/share/nginx/html/cpu.html
		echo "</body></html>" >> /usr/share/nginx/html/cpu.html
		sleep 1
	done
	grep 'HTTP/1.1" 4' /var/log/nginx/rerror.log >> /var/log/nginx/log4.log;
	grep 'HTTP/1.1" 5' /var/log/nginx/rerror.log >> /var/log/nginx/log5.log;
	DU=$(du /var/log/nginx/raccess.log | sed 's/\/var\/log\/nginx\/raccess.log//')
	if [ "$DU" -ge 500 ]
	then
		> /var/log/nginx/raccess.log
		date >> /var/log/nginx/cleaning.log
	fi
done
