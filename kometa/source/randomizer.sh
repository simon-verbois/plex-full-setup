#!/bin/bash


logger(){
    LOG_DATE="[$(date +%d-%m-%Y)|$(date +%H:%M:%S)|$(date +%Z)]"
    echo "$LOG_DATE $1"
}


disable_all_views(){
    local arr=("$@")
    logger "Disable all views"
    for item in "${arr[@]}"; do
        item=$(echo "$item" | xargs | tr -d '\r' )
        sed -i "/$item/{n;s/true/false/;}" $collections_file #1
        sed -i "/$item/{n;n;s/true/false/;}" $collections_file #2
        sed -i "/$item/{n;n;n;s/true/false/;}" $collections_file #3
    done
}


enable_view(){
    local item="$1"
    item=$(echo "$item" | xargs | tr -d '\r' )
    logger "Selected item is $item"
    sed -i "/$item/{n;n;s/false/true/;}" $collections_file #2
    sed -i "/$item/{n;n;n;s/false/true/;}" $collections_file #3
}


select_displayed_item(){
    local arr=("$@")
    local maxlen="$((${#arr[@]} - 1))"
    local randlen=$(shuf -i 0-${maxlen} -n 1)
    echo "${arr[$randlen]}"
}


select_two_random_items(){
    local arr=("$@")
    local displayed_1=$(select_displayed_item "${arr[@]}")
    local displayed_2=$(select_displayed_item "${arr[@]}")
    while [ $displayed_1 == $displayed_2 ]; do
        displayed_2=$(select_displayed_item "${arr[@]}")
    done
    disable_all_views "${arr[@]}"
    enable_view "$displayed_1"
    enable_view "$displayed_2"
}


select_one_random_item(){
    local arr=("$@")
    disable_all_views "${arr[@]}"
    enable_view $(select_displayed_item "${arr[@]}")
}


main(){
    genre_1=()
    genre_2=()
    based=()
    decade=()

    while IFS= read -r line; do
        genre_1+=("$line")
    done < <(grep "###genre1" $collections_file | tr -d '#' )

    while IFS= read -r line; do
        genre_2+=("$line")
    done < <(grep "###genre2" $collections_file | tr -d '#' )

    while IFS= read -r line; do
        based+=("$line")
    done < <(grep "###based" $collections_file | tr -d '#' )

    while IFS= read -r line; do
        decade+=("$line")
    done < <(grep "###decade" $collections_file | tr -d '#' )

    select_two_random_items "${genre_1[@]}"
    select_one_random_item "${based[@]}"
    select_two_random_items "${genre_2[@]}"
    select_one_random_item "${decade[@]}"
}

collections_file="$KOMETA_RANDOMIZER_COLLECTIONS"
current_hour=$(date +"%H" | sed 's/^0//')
kometa_hour=$(($(echo $KOMETA_TIME | cut -d':' -f1) - 1))

while true; do
    if [[ $current_hour -eq $kometa_hour || "$KOMETA_RUN" == "True" ]]; then
        logger "Starting"
        main
        logger "Ending"
        logger "Sleep for 12h to ensure kometa run freely"
        sleep 12h
    fi
    logger "Sleep for 15 minutes"
    sleep 15m
done
