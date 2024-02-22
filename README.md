This docker image is supposed to setup chipyard (1.11.0) with tools (except firesim and marshal)

The container run on amd64 and is tested on apple silicon as well.

To build please run this command in terminal inside the scope of the repo: "docker build . -t chipyard --progress plain" This might take a lot of times (sometimes more than an hour depending on ur hardware)
After it's done, use the command: "docker run -it chipyard bash" from anywhere. This will run the container in interactive mode and you should find urself in chipyard directory

To Do:
1. connect the image to an external storage to allow development on host and only build on container.
2. make the image install latest chipyard release automatically (might be already fixed)
