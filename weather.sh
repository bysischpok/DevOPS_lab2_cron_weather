#!/bin/bash

CITY="$1"
OUTPUT_FILE="/var/www/html/index.nginx-debian.html"
CURRENT_DATETIME=$(date '+%Y-%m-%d %H:%M:%S')

curl -s "wttr.in/$CITY?format=j1" | jq -r '.["current_condition"][0] | .temp_C,.humidity' | {
    read TEMP
    read HUMIDITY
    
    cat > "$OUTPUT_FILE" << EOF
<html>
<body>
    <p>Temperature in $CITY: $TEMP C</p>
    <p>Humidity in $CITY: $HUMIDITY %</p>
    <p>Current datetime: $CURRENT_DATETIME</p>
</body>
</html>
EOF
}
