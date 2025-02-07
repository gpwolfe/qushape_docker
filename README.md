### Run on Linux

To bind the current working directory as a volume in the image:  
`docker run --rm -it -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "$PWD":"/data/" qu`  

Or to make the above a little easier, the docker compose file can be run:  
`docker compose up`  

If you have a different directory you would like to use (i.e., the directory containing your data,
but not the directory containing the Dockerfile), mount that directory like so:  
`docker run --rm -it -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -v "YOUR/DIRECTORY/HERE":"/data/" qu`  

This directory will then appear as the `/data` directory in the running QuShape container  

### Run on MacOS
#### Install XQuartz  
[Official XQuartz download page](https://www.xquartz.org/index.html)  
In `XQuartz > Preferences > Security`, check both boxes (`Authenticate Connections` and `Allow connections from network clients`)
 
#### Set up XQuartz with the IP address of the user  
In the terminal, type `/usr/sbin/ipconfig getifaddr en0`  

Add this IP address to X11 access control  
  
`/opt/X11/bin/xhost + [YOUR_IP_ADDRESS]`   

#### Run the docker container  
Open XQuartz terminal window and type:  
`docker run  -e DISPLAY="[YOUR_IP_FROM_ABOVE]:0" -v "YOUR/DIRECTORY/HERE":"/data/" qu`
