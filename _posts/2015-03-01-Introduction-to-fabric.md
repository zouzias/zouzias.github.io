---
layout: post
title: DevOps- Introduction to Fabric.
---

In this post, we will introduce [Fabric](http://www.fabfile.org/). Fabric is simple, yet powerful, tool for remotely controlling a farm of servers from your laptop.

As a warmup example, let's assume that you want to check the uptime of a list of servers, say server1.example.com, server2.example.com, ..., serverN.example.com. 

Of course, you can always write a bash script as the one below to do so,

{% highlight bash %}
HOSTS=server1.example.com,server2.example.com,...,serverN.example.com

for HOST in HOSTS
do
    ssh -i ~/.ssh/example_rsa @{USER}@HOST -s 'uptime'
done

{% endhighlight %}



### Installing Fabric

To install fabric, you first need to ensure that you have Python installed, and also install [python-pip](https://pip.pypa.io/en/latest/installing.html). Then, to instal fabric simply do

{% highlight bash %}
sudo pip install fabric
{% endhighlight %}

### Configuring Fabric

Configure fabric is straightforward. Simply create a `fabfile.py` in you current directory with the following content.

{% highlight python %}
from fabric.api import env
from fabric.operations import run, put, sudo,local


# Setup username and its RSA key
env.user  = 'ubuntu'
env.key_filename = '~/.ssh/example_rsa'

# Populate host names 
with open('servers.txt') as f:
    env.hosts = f.readlines()

def uptime():
    run('uptime')
{% endhighlight %}

### Running Fabric

To run fabric, simply do 

{% highlight bash %}
fab uptime
{% endhighlight %}



