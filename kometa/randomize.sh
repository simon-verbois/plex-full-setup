#!/bin/bash

genre_1=("ActionAdventure" "Comédie" "Science-Fiction" "Familial" "Thriller" "Fantastique")
genre_2=("Drame" "Horreur" "Guerre" "Animation" "Crime" "Histoire")
genre_3=("Musique" "Mystère" "Romance" "Western" "Biographie")
based=("books" "true_story" "video_games")
continent=("Americas" "Antarctica" "Asia" "Europe" "Oceania")
seasonal=("valentine" "christmas" "halloween")
decade=("1960" "1970" "1980" "1990" "2000" "2010" "2020")
config_file="config/config.yml"

select_displayed_item(){
    local arr=("$@")
    local maxlen="$((${#arr[@]} - 1))"
    local randlen=$(shuf -i 0-${maxlen} -n 1)
    echo "${arr[$randlen]}"
}

disable_all_views(){
    local arr=("$@")
    for item in ${arr[@]}; do
        sed -i "s/visible_home_${item}: .*/visible_home_${item}: false/" $config_file
        sed -i "s/visible_shared_${item}: .*/visible_shared_${item}: false/" $config_file
    done
}

enable_view(){
    local item="$1"
    sed -i "s/visible_home_${item}: .*/visible_home_${item}: true/" $config_file
    sed -i "s/visible_shared_${item}: .*/visible_shared_${item}: true/" $config_file
}

select_two_random_items(){
    local arr=("$@")
    local displayed_1=$(select_displayed_item "${arr[@]}")
    local displayed_2=$(select_displayed_item "${arr[@]}")
    while [ $displayed_1 == $displayed_2 ]; do
        local displayed_2=$(select_displayed_item "${arr[@]}")
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

select_on_seasonal_item(){
    local arr=("$@")
    current_day=$(date +"%d")
    current_month=$(date +"%m")
    disable_all_views "${arr[@]}"
    if [[ $current_month -eq 12 && $current_day -ge 15 ]]; then
        enable_view christmas
    elif [[ $current_month -eq 2 && $current_day -ge 12 && $current_day -le 16 ]]; then
        enable_view valentine
    elif [[ $current_month -eq 10 && $current_day -ge 24 ]]; then
        enable_view halloween
    fi
}

main(){
    select_two_random_items "${genre_1[@]}"
    select_two_random_items "${genre_2[@]}"
    select_two_random_items "${genre_3[@]}"

    select_one_random_item "${based[@]}"
    select_one_random_item "${continent[@]}"
    select_one_random_item "${decade[@]}"

    select_on_seasonal_item "${seasonal[@]}"
}

main
