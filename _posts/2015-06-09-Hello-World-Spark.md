---
layout: post
title: "Hello World in Apache Spark"
tags:
- spark
- scala
- bigdata
---

In this post, we present a hello world application in [Apache Spark](https://spark.apache.org/).

Spark is a general engine for large-scal data processing. The main differenting factor compared to the map-reduce framework is it's ability to cache intermediate results in-memory.

### Install Scala and SBT

First, install [Scala](http://www.scala-lang.org/download/install.html) and [SBT](http://www.scala-sbt.org/release/tutorial/Setup.html) first.

### Download Apache Spark

Download spark from [here](https://spark.apache.org/downloads.html). Uncompress the contents to a directory and set up the enviroment variable SPARK_HOME to the extracted contents.


The source code is available on [github](https://github.com/zouzias/spark-hello-world)


{% highlight scala %}
object HelloWorld {
  def main(args: Array[String]) {

    // initialise spark context
    val conf = new SparkConf().setAppName("HelloWorld")
    val sc = new SparkContext(conf)

    println("************")
    println("Hello, world!")
    println("************")

    // terminate spark context
    sc.stop()
  }
}
{% endhighlight %}
