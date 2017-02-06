[![](https://images.microbadger.com/badges/image/mpatton/onionscan.svg)](https://microbadger.com/images/mpatton/onionscan "Get your own image badge on microbadger.com")

# OnionScan
*OnionScan in a Docker container*
Based on https://github.com/s-rah/onionscan.

> The purpose of this tool is to make you a better onion service provider. You owe it to yourself and your users to ensure that attackers cannot easily exploit and deanonymize.

Run the container like so:
```
docker run -d --cap-drop=all --name onionscan mpatton/onionscan
```

This will startup the Tor connection and allow you to do the following:
```
docker exec -it onionscan onionscan <options> <onion address>
```

See https://github.com/s-rah/onionscan for further information.

---
Note:  Run the following to make sure Tor has fully started, prior to running your scan:
```
docker logs -f onionscan
```

---
For a bash function to automate the process of pulling and starting the onionscan daemon container add the following to your `.bashrc`:
```bash
function onionscan(){
	onionscanrunning=$(docker inspect --format "{{.State.Running}}" onionscan 2>/dev/null)
	if [ "$onionscanrunning" == "true" ]
	then
		docker exec -it onionscan onionscan $@
	else
		docker rm $(docker ps -a | grep "onionscan" | cut -d " " -f1)
		docker run -d --cap-drop=all --name onionscan mpatton/onionscan
		docker exec -it onionscan onionscan $@
	fi
}
```

Using the above function will allow you to run `onionscan` as if it were installed natively. Now you can simply use the following syntax in a terminal:
```
onionscan <options> <onion address>
```
