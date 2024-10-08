# Plex-full-setup
## Description
An almost complete project for Plex, aiming to run on Docker, it can be adapted to run on many platforms.

## Purpose
The aim of this project is to get the most autonomous Plex instance possible, while offering the best user experience. <br>
I therefore use more sub-applications and scripts to help me in my task. <br>
I chose the docker platform to offer as much portability as possible (there are some elements to adapt to run elsewhere than on linux or synology).

## Explanation 
This will produce a home page like this every day:
- continue watching 
- trending movies
- recently added
- 2 random genre in a list of 6
- top 250 IMDb
- based on (in a list of 3)
- 2 random genre in a list of 6
- best don't watch movies 
- best from a decade (random from 1960s to 2020s)
- 2 random genre in a list of 5
- films shot by continent (random every day too)

## Usage
Don't forget to custom the plex recommandations order in the library settings, like this you will get a better result.

## Dev
I'm planning other improvements in the future, such as decompiling MKV files (or other video containers) in order to carry out some security scans, and developing a python script to convert subtitle files into SRT format (for greater user customization).<br>
Don't forget to bookmark this project for future updates (you've got time for a coffee or two). <br>
I'm also planning to add the tv shows and animes management.

## Update the apps
I've create a little script who's in charge of updating to the latest the apps every sunday at 4 am.
You have to adapt the volume path in the script. <br>
`0   4   *   *   0   root    /bin/bash /volume1/docker/docker-updater.sh`
