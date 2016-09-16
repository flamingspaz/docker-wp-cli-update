# docker-wp-cli-update

A simple docker container to update a wordpress instance using wp-cli. Mainly for use on Chronos/Mesos with the Docker containerizer.

## Usage

### Standalone
```
# docker pull yalam96/docker-wp-cli-update
# docker run --rm -i -t -v /path/to/wordpress/:/var/www/html yalam96/docker-wp-cli-update
```

### Chronos
```
{
  "schedule": "R0/2016-09-16T09:45:00Z/PT24H",
  "name": "wp-cli-update",
  "container": {
    "type": "DOCKER",
    "image": "yalam96/docker-wp-cli-update",
    "network": "BRIDGE",
    "volumes": [
      {
        "containerPath": "/var/www/html",
        "hostPath": "/srv/path/to/wordpress",
        "mode": "RW"
      }
    ]
  },
  "cpus": "0.5",
  "mem": "512",
  "uris": [],
  "command": "/bin/wp core update --path=/var/www/html"
}
```
