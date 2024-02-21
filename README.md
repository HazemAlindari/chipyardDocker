This dcoker container is supposed to setup chipyard (1.11.0) with tools (except firesim and marshal)

The container run on amd64 and is tested on apple silicon as well.

To build please run this command in terminal inside the scoope of the repo: "docker build . -t chipyard --progress plain" This might take a lot of times (sometimes more than an hour depending on ur hardware)
After it's done, use the command: "docker run -it chipyard bash" from anywhere. This will run the container in interactive mode and chipyard repo should be in the main repo; so you can navigate to "cd chipyard".

To Do:
1. connect the image to an external storage to allow development on host and only build on container.
