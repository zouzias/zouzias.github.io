---
layout: post
title: "DevOps: Introduction to Fabric."
comments: true

tags:
- fabric
- devops
---

In this post, we will introduce [Fabric](http://www.fabfile.org/).

Fabric is a simple, yet powerful, tool for remotely controlling a farm of servers from your terminal.

As a warmup example, let's assume that you want to check the uptime of a list of servers, say server1.example.com, server2.example.com, ..., serverN.example.com. 

Of course, you can always write a bash script as the one below to do so,

{% highlight bash %}
#!/bin/bash
HOSTS=server1.example.com,server2.example.com,...,serverN.example.com

for HOST in HOSTS
do
    ssh -i ~/.ssh/example_rsa @{USER}@HOST -s 'uptime'
done

{% endhighlight %}

A curious reader might ask <strong>why</strong> to bother using fabric or any other tool for the above operation?

An answer to this question is that fabric focuses on <strong>what</strong> are the operations to be performed on the servers whereas the above script has to be also concerned of <i>how</i> the tasks will be executed. For example, how would you run the above `for loop` in parallel? Using fabric is quite simple, see [parallel fabric](http://docs.fabfile.org/en/latest/usage/parallel.html) for more details.

Next, we describe how to install fabric and then how to configure it for the above uptime task.


### Installing Fabric

To install fabric, you first need to ensure that you have Python installed, and also install [python pip](https://pip.pypa.io/en/latest/installing.html). Then, to instal fabric simply do

{% highlight bash %}
sudo pip install fabric
{% endhighlight %}

### Configuring Fabric

Configure fabric is straightforward. Simply create a `fabfile.py` in you current directory with the following content. Also create a `server.txt` with its i-th line equal to `server{i}.example.com`.

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

To execute fabric in parallel, you can simple do

{% highlight bash %}
fab uptime -P
{% endhighlight %}

See [parallel fabric](http://docs.fabfile.org/en/latest/usage/parallel.html) for more details on parallel execution.


{% if page.comments %}
<div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = "https://www.zouzias.org/2015/03/01/Introduction-to-fabric/";
this.page.identifier = "fabric";
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://zouzias.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
{% endif %}
