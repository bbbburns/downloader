# Download Speed Tester

A very poorly made tool that no one should ever use for anything important.

Helpful to download a file over time and get some stats about the download
including speed.

# Instructions

1. Setup a cron job on some Linux system that runs downloader.sh periodically.
2. This system must have the ABSOLUTE LATEST version of Curl because we need the -w "%{json}" flag.
3. After some time, get the contents of /var/log/download.txt from the target
   system.
4. Run `cat download.txt | grep '{' > json_obj_download.txt` to remove all
   timestamps. TODO - fix this.
5. Run `python3 parse_download.py` to output a CSV of your download stats over
   time.
6. Add your timestamps back somehow. Good luck!
7. Make graphs now that you have CSV data.

