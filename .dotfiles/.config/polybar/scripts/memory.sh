FILE="/proc/meminfo"
TOTAL="$(grep 'MemTotal' $FILE | gawk '{print $2}')"
FREE="$(grep 'MemFree' $FILE | gawk '{print $2}')"

USED="$(( ( $TOTAL - $FREE ) / 1024 ))"
echo "$USED MiB"
