while true; do
    echo "Listening on port 6969..."
    
    output=$(nc -l 6969)
    line_count=$(echo "$output" | wc -l)

    echo "$output"
    
    if [ "$line_count" -gt 1 ]; then
        echo "More than one line detected. Exiting loop."
        break
    fi

    echo "Restarting connection on 6969"
done
