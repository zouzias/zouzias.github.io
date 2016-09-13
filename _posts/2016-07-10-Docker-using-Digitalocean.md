---
layout: post
title: Docker using Digitalocean
tags:
- docker
- digitalocean
- web
- devops
---

In this post, we show how to operate docker using Digitalocean's cloud provider. With the introduction of `docker-machine` in the recent versions of Docker, spinning a new droplet with docker is a few bash command lines away.

## Requirements

You need to have a digitalocean's account along with an access token to create droplets. For more details, see [Digitalocean website](https://cloud.digitalocean.com/login).

From now on, we assume that you have set your digitalocean access token that allows you to create a new droplet and it is set to an environment variable, i.e.,

{% highlight bash %}
export DIGOCEAN_TOKEN=XXXXXXXXXXX
{% endhighlight %}

# Start up Rancher

Rancher is a containers administration and monitoring tool. In the next few steps, we create a droplet that runs Rancher which will allow us to operate our containers.

{% highlight bash %}
# Creates a Rancher droplet
#!/bin/bash

export DROPLET_NAME=rancher
export DIGITALOCEAN_REGION=fra1 # Frankfurt, you may want to change this
export DIGITALOCEAN_SIZE=2gb
export DIGITALOCEAN_PRIVATE_NETWORKING=true

docker-machine create --driver digitalocean \
                      --digitalocean-access-token ${DIGOCEAN_TOKEN} \
                      ${DROPLET_NAME}
{% endhighlight %}

Run the above script to create a Rancher droplet. Then, ssh to this droplet using

```
docker-machine ssh rancher
```

And then run `docker run -d --restart=always -p 8080:8080 rancher/server` to start the Rancher server. Do a `docker ps` to check the logs

{% highlight bash %}
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                              NAMES
3f6fd41d0b86        rancher/server      "/usr/bin/s6-svscan /"   7 minutes ago       Up 7 minutes        3306/tcp, 0.0.0.0:8080->8080/tcp   compassionate_ritchie
{% endhighlight %}


Logout from the droplet and do to see the IP of your Rancher server.

{% highlight bash %}
docker-machine ip rancher
46.101.105.42
{% endhighlight %}

Browse to `http://46.101.105.42:8080/`

## Add a docker host to Rancher

To add a node on rancher, you just need to run rancher agent on any node, say rancher node. Go to Rancher web interface and follow the instruction to add a host.
