---
layout: post
title: Configure Tomcat Plugin in Nagios
---

In this post, we will discuss how to monitor Apache Tomcat 7 using Nagios on Ubuntu 14.04. We will assume that nagios server has been configured as described in the following guide:

[Nagios on Ubuntu](https://help.ubuntu.com/lts/serverguide/nagios.html)

First, download the [Tomcat plugin](http://exchange.nagios.org/directory/Plugins/Java-Applications-and-Servers/Apache-Tomcat/check_tomcat-2Epl/details) into `/usr/lib/nagios/plugins/` directory. You should also see all other plugins there. Rename the plugin from `check_tomcat.pl` to `check_tomcat`.

Just to be on the safe side, install a XML dependency that is used by the plugin using 

```sudo apt-get install libxml-xpath-perl```

Second, append the following lines in the file /etc/nagios3/command.cfg

```
# check_tomcat command definition
define command{
       command_name check_tomcat
       command_line /usr/bin/perl /usr/lib/nagios/plugins/check_tomcat -H $HOSTADDRESS$ -p $ARG1$ -l $ARG2$ -a $ARG3$ -w $ARG4$ -c $ARG5$
       }
```

Third, add the following service definition in the host that you want to check if Tomcat is running. In our case we will use localhost. Replace localhost with your desired host.

```
# Define a service to check the state of a Tomcat service
define service{
       use                  generic-service
       host_name            localhost
       service_description  Tomcat
       check_command        check_tomcat!8080!tomcat_username!tomcat_password!25%,25%!10%,10%
}
```

Finally, restart nagios using

```
sudo service nagios3 restart
```

Wait 5 minutes and then Nagios's web interfacet.
