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
