To bind the current working directory as a volume in the image:
docker run --rm -it -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "$PWD":"/data/" qu

And to make the above a little easier, the docker compose file can be run:
docker compose up

If you have a different directory you would like to use, mount that directory like so:
docker run --rm -it -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "YOUR/DIRECTORY/HERE":"/data/" qu

This directory will then appear as the /data directory in the running QuShape container


In order to run on MacOS, the following needs to be set up:

Install XQuartz
In XQuartz > Preferences > Security, check both boxes (Authenticate Connections, Allow connections from network clients)

In Terminal:
find ip address of user
/usr/sbin/ipconfig getifaddr en0

add this ip address to X11 access control
/opt/X11/bin/xhost + [YOUR_IP_ADDRESS]

Open XQuartz terminal window
Run:
docker run  -e DISPLAY="[YOUR_IP_FROM_ABOVE]:0" -v "YOUR/DIRECTORY/HERE":"/data/" qu
