ps -ef | grep iperf | grep -v grep | awk '{print $2}' | xargs kill
