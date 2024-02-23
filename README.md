<h3>Chipyard Docker</h3>
<p>This docker image does setup chipyard (latest tag) with tools (except firesim and marshal, to install those too, simply remove --skip-firesim --skip-marshal from installChipyardWithTools.sh)</p>
<p><strong>The container run on amd64 and is tested on apple silicon.</strong></p>
<h4><br />To run this container:</h4>
<p>docker pull hazemjaki/chipyard<br />docker run -it hazemjaki/chipyard bash</p>
<h4>To Build urself:</h4>
<p>To build please run this command in terminal inside the scope of the repo: "docker build . -t chipyard --progress plain" This might take a lot of times (sometimes more than an hour depending on ur hardware)<br />After it's done, use the command: "docker run -it chipyard bash" from anywhere. This will run the container in interactive mode and you should find urself in chipyard directory</p>
<h4>To Do :</h4>
<p>1.Try to make the image size smaller by deleting not needed pachages before image export</p>
