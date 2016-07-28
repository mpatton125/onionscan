# onionscan
*Onionscan in a Docker container*

Based on https://github.com/s-rah/onionscan.

Run the container like so:
```
docker run -d --name onionscan mpatton/onionscan
```

This will startup the Tor connection and allow you to do the following:
```
docker exec -it onionscan onionscan <options> <onion address>
```

See https://github.com/s-rah/onionscan for further information.
