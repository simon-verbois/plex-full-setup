# Plex
## Description
Plex is a media server software that allows you to organize, stream, and enjoy your digital media collections, such as movies, TV shows, music, and photos, across various devices. Key features include:
- Media Organization: Automatically organizes your media library with rich metadata, including cover art, descriptions, and ratings.
- Streaming: Streams your media content to any device, including smartphones, tablets, smart TVs, and gaming consoles.
- Remote Access: Provides access to your media library from anywhere with an internet connection.

## Purpose
I use Plex to manage my movie, series and anime libraries

## Usage
1. Adapt the timezone in .env
2. Add your claim token in .env
3. Adapt your volume path in docker-compose.yml
4. Start the docker with `docker-compose up -d`
5. Check with `docker logs plex -f`

## Links
Source: https://www.plex.tv/ <br>
Wiki: https://wiki.seeedstudio.com/OpenWrt-Plex-Media-Server-on-Docker/ <br>
Plex token: https://www.plex.tv/claim