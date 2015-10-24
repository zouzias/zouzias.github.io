---
layout: post
title: Monitor Elasticsearch with Nagios
tags:
- nagios
- devops
- web
- elasticsearch
- ubuntu
---

In this post, we demonstrate how to monitor the status of an elasticsearch cluster using Nagios on Ubuntu 14.04.

## Nagios server setup

We assume that a nagios server has been configured on the address `nagios.your_host_name.com` as described in the following guide:

[Installing Nagios on Ubuntu](https://help.ubuntu.com/lts/serverguide/nagios.html)

### Install the elasticsearch plugin

First, download the [Elasticsearch plugin](https://github.com/zouzias/check_elasticsearch) into `/usr/lib/nagios/plugins/` directory (into your Nagios server `nagios.your_host_name.com`). You should also see all other plugins in the `/plugins` directory.

Second, define a `check_elasticsearch` command by appending the following lines in the file `/etc/nagios3/command.cfg`

{% highlight ruby %}
# check_elasticsearch command definition
define command{
       command_name check_elasticsearch
       command_line /usr/bin/perl /usr/lib/nagios/plugins/check_elasticsearch -H $HOSTADDRESS$
}
{% endhighlight %}

Third, add the following service definition in the host that you want to check if Elasticsearch is running. In our case we will use the host `es1.example.com`.

{% highlight ruby %}
# Define a service to check the state of the elasticsearch node
define service{
       use                  generic-service
       host_name            es1.example.com
       service_description  Elasticsearch
       check_command        check_elasticsearch
}
{% endhighlight %}

Finally, restart nagios using

{% highlight bash %}
sudo service nagios3 restart
{% endhighlight %}

Wait 5 minutes and then check Nagios's web interface, i.e., browse to `http://nagios.your_host_name.com/nagios3/`.

## Related posts

See also [Tomcat using Nagios]({% post_url 2015-02-26-Tomcat-Plugin-in-Nagios %})
