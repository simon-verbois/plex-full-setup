# Kometa
## Description
KOMETA (Plex Meta Manager) is a powerful tool designed to automate metadata management for Plex. Key features include:
- Metadata Automation: Syncs media metadata with online databases like TheMovieDB and TheTVDB, ensuring accurate and up-to-date information.
- Dynamic collections: Creates and maintains dynamic collections based on user-defined criteria and rules.
- Scheduled Updates: Configurable to perform regular library updates, keeping media collections organized without manual intervention.
- Advanced Customization: Offers extensive customization for metadata management and display preferences.

## Purpose
I use Kometa to automate my collections, as well as the display on my home page.<br>
I wanted to reproduce a home page that was a little more lively, like those on Netflix, Amazon Prime, etc.<br>
So I used this collection system to achieve my goals.
The randomizer script will run via a crontab (schedule), automatically modifying Kometa's configuration and changing the homepage every night.

## Usage
1. Adapt the timezone and running schedule in .env
2. Adapt your volume path in docker-compose.yml
3. Get your API token for each app (look at links section), then add them in the config.yml
4. If you don't want a french library, you should translate these keys value in config.yml: (5-10 min)
- name_*
- summary_*
5. Don't touch to the visible_* keys, they are managed by the randomizer.sh (I'll explain it right after)
6. franchise and universe are not mandatory
7. You can find the Disney/Pixar collection in collections.yml, from there you can build your fully custom collections
8. Transalte the summary key in collections.yml (1-2 min)
9. The only thing you have to do, is translate the list content (depend on you language), these words are the yml keys used by Kometas (4-6 min)
10. Add a schedule to run the script (in my case, /etc/crontab on Synology (via SSH)) <br>
`30   2   *   *   *   root    /bin/bash /volume1/docker/kometa/randomizer.sh`
11. If the script randomizer is running correctly, you can start the docker with `docker-compose up -d`, it will be executed every night at 5am (refer to step 1)
12. Check with `docker logs kometa -f`

## Links
Source/Wiki: https://kometa.wiki/en/latest/ <br>
Plex token: https://kometa.wiki/en/latest/config/plex/?h=plex+auth <br>
TMDb token: https://kometa.wiki/en/latest/config/tmdb/?h=tmdb <br>
Trakt token: https://kometa.wiki/en/latest/config/trakt/?h=trakt