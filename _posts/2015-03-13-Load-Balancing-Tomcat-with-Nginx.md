---
layout: post
title: Load Balancing Apache Tomcat using Nginx.
tags:
- tomcat
- nginx
- web
---

In this post, we will configure [Nginx Server](http://http://nginx.org//) as a load balancer for Apache Tomcat. First, 
we will provide the configuration of nginx for proxying a single Apache Tomcat instance. Later, we will show how this configuration can be extended for load-balancing a set of Apache Tomcat Servers.

In your nginx server, populate the `/etc/nginx/sites-available/default` file with the following content (here we use Ubuntu 14.04).

{% highlight text %}
server {
    listen nginx.example.com:80;
    server_name  nginx.example.com;

    location / {
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://tomcat.example.com:8080/;
    }
}
{% endhighlight %}

Reload the above configuration file with `sudo service nginx reload`, you should see something like

{% highlight text %}
 * Reloading nginx configuration nginx                                   [ OK ] 
{% endhighlight %}



Then, hit `http://nginx.example.com` in your browser. You should see the default Apache Tomcat webpage.

Sources:

[Mkyong](http://www.mkyong.com/nginx/nginx-apache-tomcat-configuration-example/)

Add more
