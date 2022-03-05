# UNIT3D auto upload
Automatically parse, rename, and upload torrents to trackers using the UNIT3D codebase
### Supported sites:
<table>
    <tbody>
    <tr style="text-align: left">
        <td><strong>DBy</strong></td>
        <td><strong><a href="https://danishbytes.club">DanishBytes</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>ACM</strong></td>
        <td><strong><a href="https://asiancinema.me">AsianCinema</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>ATH</strong></td>
        <td><strong><a href="https://aither.cc">Aither</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>BHD</strong></td>
        <td><strong><a href="https://beyond-hd.me">Beyond-HD</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>BLU</strong></td>
        <td><strong><a href="https://blutopia.xyz">Blutopia</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>R4E</strong></td>
        <td><strong><a href="https://racing4everyone.eu">Racing4Everyone</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>Telly</strong></td>
        <td><strong><a href="https://telly.wtf">Telly.wtf</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>Ntelogo</strong></td>
        <td><strong><a href="https://ntelogo.org">Ntelogo</a></strong></td>
    </tr>
    <tr style="text-align: left">
        <td><strong>UFHD</strong></td>
        <td><strong><a href="https://uncutflixhd.com/">Uncutflixhd</a></strong></td>
    </tr>
    </tbody>
</table>

<!-- Basic setup -->
# Basic setup:
1. Clone / download this repository
2. Install necessary packages ```pip3 install -r requirements.txt```
3. install patch for fast resuming of torrents in rtorrent
   look here for more information https://github.com/rakshasa/rtorrent/issues/489
   ```chmod u+x patch_fast_resume.sh```
   ```sudo ./patch_fast_resume.sh```
   make rtorrent_fast_resume.pl executable
   ```chmod u+x rtorrent_fast_resume.pl```
   
4. Rename `config.env.sample` to `config.env`
5. Fill out the required values in `config.env`
6. Ensure you have [mediainfo](https://mediaarea.net/en/MediaInfo/Download/Ubuntu) & [ffmpeg](https://ffmpeg.org/download.html) installed on your system
7. Run the script using [Python3](https://www.python.org/downloads/) (If you're having issues or torf isn't installing, try python3.9)
8. Remember to make both auto_upload.py and autoupload.sh executeable by doing the following

   ```chmod u+x auto_upload.py```
   ```chmod u+x autoupload.sh```
   
   <br /> 
   
**Things to note:**
1. We use TMDB API for all things media related (Title, Year, External IDs, etc)
2. If you're trying to pass in a file as an arg, you may find autocomplete isn't working. Do this to fix it
    * (What I mean by autocomplete is when you double hit *Tab*, and the filename/folder gets automatically filled in)
    * ```chmod u+x auto_upload.py```
    * run script using ```./auto_upload.py -t etc -p /path/to/release```
3. A folder called ``temp_upload`` will be created which will store the files:
    * ```description.txt``` ```mediainfo.txt``` ```*.torrent```
4. if you want to automatically watch a folder for new uploads remember to add autoupload.sh to your crontab
    * ```* * * * * /path/to/autoupload.sh >/dev/null 2>&1```
    * change the media_watch_location in config.env to the folder you will be watching for new releases
    * move new uploads into the watchfolder directory
    
   

# Wiki
### [Video usage examples](https://github.com/ryelogheat/xpbot/wiki/Video-examples)
### [Available args & user input](https://github.com/ryelogheat/xpbot/wiki/Args-and-User-Input)
### [config.env breakdown](https://github.com/ryelogheat/xpbot/wiki/config.env)
### [/site_templates/*.json guide](https://github.com/ryelogheat/xpbot/wiki/Tracker-Templates)
### [Automatic re-uploading (autodl)](https://github.com/ryelogheat/xpbot/wiki/autodl-irssi-automatic-re-uploading)

