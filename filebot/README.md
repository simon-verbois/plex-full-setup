# Filebot
## Description
FileBot is a versatile software tool designed primarily for renaming and organizing media files such as TV shows, movies, and anime. Here are its main features:
- Automatic Renaming: It automatically renames files based on data from online databases like TheTVDB, TheMovieDB, and TVmaze, ensuring a consistent and organized naming convention.
- Subtitle Search: FileBot can search for and download subtitles for your video files from sites like OpenSubtitles.
- Batch Processing: It allows you to rename multiple files at once, which is especially useful for large collections.
- Automation Scripts: It supports scripting to automate repetitive tasks.
<br>
Please note: this software requires a license


## Purpose
I use filebot to retrieve my download files and transfer them to my Plex library folders.<br>
It will automatically monitor my download folder, and take care of the renaming and transfer itself.<br>
I'd say this application has 98% accuracy, I've had very few bad matches with it.

## Usage
1. Adapt the timezone and language in .env
2. Adapt your volume path (and port if needed) in docker-compose.yml
3. Create a data folder
4. Add your licence file in the data folder (Look at the example)
5. Run `docker-compose up -d`
6. Check with `docker logs filebot -f`

## Dev
I'm currently developing a python script to convert the various subtitle formats into SRT. Filebot will help me with this by downloading a subtitle file directly into the media folder.


## Links
Source: https://www.filebot.net <br>
Wiki: https://www.filebot.net/forums/viewtopic.php?t=7 <br>
Licence: https://www.filebot.net/purchase.html