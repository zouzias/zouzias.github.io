---
layout: post
title: "How to setup multiple versions of Scala on Mac OS"
tags:
- scala
- macos
- osx
- brew
- config
---

In this post, we demonstrate how to install multiple versions of [Scala](http://www.scala-lang.org/) on a MacOS environment. We will assume that the package manager [HomeBrew](http://brew.sh/) is already installed.

### Installing brew

To o install brew, follow the instruction [here](http://brew.sh/).

## Installing latest version of Scala

To install the latest version of Scala is straightforward, type

{% highlight bash %}
brew update
brew install scala
{% endhighlight %}

To verify and check the installed Scala version, type

{% highlight bash %}
brew info scala scala
{% endhighlight %}

As of August 2015, the above set of command will install Scala version 2.11.x.

### Installing Scala version 2.10

To install a different version of Scala, i.e., Scala 2.10, do the following

{% highlight bash %}
# checkout to the history version of scala.rb
cd /path/to/homebrew (default is /usr/local)
git checkout d64edec425df44918c58b6b021ffef2628242248 Library/Formula/scala.rb
brew unlink scala   # In case you have alreadly scala 2.11+ scala installed
brew info scala     # you will see the 2.10 version
brew install scala  # Install scala 2.10.4
# after install, turn back to the master version
git checkout master Library/Formula/scala.rb
# install both 2.10 & 2.11,
# brew switch can easily switch to any specific version
brew switch scala 2.10
brew switch scala 2.11  
{% endhighlight %}


# References

The above instruction set is a distillation of the following two gists:

* [dimetron gist](https://gist.github.com/dimetron/4340744)
* [cuber gist](https://gist.github.com/cuber/11292869)
