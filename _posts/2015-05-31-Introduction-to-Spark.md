---
layout: post
title: "Introduction to Spark"
tags:
- spark
- scala
- bigdata
---

In this post, we will briefly introduce [Apache Spark](https://spark.apache.org/).

Spark is a general engine for large-scal data processing. The main differenting factor compared to the map-reduce framework is it's ability to cache intermediate results in-memory.


To start with Spark, simply download a pre-compiled version from the above site and type `bin/spark-shell`.

Spark's main abstraction is called RDD (Resilient Distributed Datasets). Below we summarize most of the available operations/transformation of an RDD.

{% highlight scala %}

{% endhighlight %}


### RDD Input

### RDD Inspection Operations

The following are a few operations that are helpful to inspect the elements of an RDD

* aRDD.first() 	:	get the first element of an RDD
* aRDD.take(10)   :   take 10 elements
* aRDD.sample()   :   sample elements from RDD

### RDD Operations

There are several operation available on RDD from which we only highlight the most commonly used ones, i.e, `map`, `reduce`, `reduceByKey`, `filter`, `groupBy`, `join`.


{% highlight scala %}
scala> val a = Array((1,2), (2,4), (3,5))
a: Array[(Int, Int)] = Array((1,2), (2,4), (3,5))

val aRDD = sc.makeRDD(a)
aRDD: org.apache.spark.rdd.RDD[(Int, Int)] = ParallelCollectionRDD[0] at makeRDD at <console>:23


{% endhighlight %}


### RDD Output
