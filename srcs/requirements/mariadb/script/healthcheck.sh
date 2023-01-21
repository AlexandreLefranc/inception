#!/bin/sh

output=$(ps -o pid,user,comm | sed -n 2p | xargs)
expect="1 mysql mysqld"

echo "output = $output"
echo "expect = $expect"

if [ "$output" = "$expect" ]; then
    echo "PID 1 is mysqld"
    exit 0
else
    echo "PID 1 is NOT mysqld"
    exit 1
fi