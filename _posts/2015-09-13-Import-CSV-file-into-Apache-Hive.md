---
layout: post
title: "Import CSV files into Apache Hive"
tags:
- hive
- csv
- hadoop
- hdfs
- bigdata
---

A common task that might be required by a big data scientist is to load a CSV file into [Apache Hive](https://hive.apache.org/). Apache Hive is a SQL-like database sitting on top of Hadoop's distributed file system (HDFS).

In this post, we give a step-by-step approach to import a CSV file into Apache Hive. We assume that Apache Hive has been properly configured along with HDFS.

The main steps are the following:

1. First copy the csv file `data.csv` into HDFS.
2. Create a table in Hive to store the contents of `data.csv`
3. Import `data.csv` into the above relation.

### Copy file into HDFS
This is pretty straightfoward:

{% highlight bash %}
# Copy test.csv into HDFS
hadoop fs -put /path/on/localsystem/data.csv /path/on/hdfs/data.csv
{% endhighlight %}

### Create Hive Table

Start hive console and create a table `example`.

{% highlight bash %}
hive
hive> CREATE TABLE example(name String, address String, price int)\
 ROW FORMAT DELIMITED FIELD TERMINATED BY ',' ESCAPED BY '\\' STORED AS TEXTFILE;
{% endhighlight %}

The above command creates a table named example with fields 'name', 'address' and 'price'. Moreover, it defines the storage of the table as a text file whose rows are its records delimited by ',' and also commas escaped by '\\'.

Moreover, note that the fields of example must have the same order as in `/path/on/hdfs/data.csv`

### Load data into Hive Table

To load data into table `example`, you simple type:
{% highlight bash %}
hive> LOAD DATA INPATH '/path/on/hdfs/data.csv' OVERWRITE INTO TABLE example;
{% endhighlight %}

Note that the above command will delete the file `/path/on/hdfs/data.csv`.
