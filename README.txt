To bind the current working directory as a volume in the image:
docker run --rm -it -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "$PWD":"/data/" qu

And to make the above a little easier, the docker compose file can be run:
docker compose up

If you have a different directory you would like to use, mount that directory like so:
docker run --rm -it -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "YOUR/DIRECTORY/HERE":"/data/" qu

This directory will then appear as the /data directory in the running QuShape container
