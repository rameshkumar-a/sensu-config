cpu () {
	echo demo-Metrics-agent cpu=$(mpstat | awk '$11 ~ /[0-9.]+/ { print 100 - $11 }') $(date +%s)
}

disk_io () {
	echo demo-Metrics-agent disk_io=$(iostat -d -z ALL | awk 'NF==6 {s+=$2} END {print s}') $(date +%s)
}

disk_usage () {
	echo demo-Metrics-agent disk_usage=$(df -k / | awk 'NR > 1 {print $5}' | cut -d "%" -f 1) $(date +%s)
}

heartbeat () {
	echo demo-Metrics-agent heartbeat=1 $(date +%s)
}

memory () {
	echo demo-Metrics-agent memory=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }') $(date +%s)
}

network_io () {
	echo demo-Metrics-agent network_in=$(($((`date "+%s"`)) % 30)) $(date +%s)
        echo demo-Metrics-agent network_out=$(($((`date "+%s"`+ 15 )) % 30)) $(date +%s)
}

ping_ok () {
	ping -c 1 $PING_REMOTE_HOST > /dev/null 2>&1
  	if [ $? -eq 0 ]; then
    	echo demo-Metrics-agent ping_ok=1 $(date +%s)
  	else
    	echo demo-Metrics-agent ping_ok=0 $(date +%s)
  	fi
}

cpu
disk_io
disk_usage
heartbeat
memory
network_io
ping_ok
