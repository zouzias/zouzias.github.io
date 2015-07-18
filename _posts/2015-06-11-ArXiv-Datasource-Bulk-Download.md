---
layout: post
title: "Bulk Download of ArXiv's Repository"
tags:
- opendata
- aws
- bigdata
---

In this post, we demonstrate step-by-step how to download all papers from [ArXiv](http://arxiv.org). ArXiv is an open access repository in which researchers share their manuscripts before their publication to a conference or journal.

The arXiv dataset is available on Amazon's S3 cloud storage and it is not freely available. As of the date of this post, the cost is around 50$.

This post is a distillation of the following [page](http://arxiv.org/help/bulk_data_s3).

## Install python and s3cmd

First, install [Python](). To access amazon's S3, we will use a forked version of [s3cmd]() which is available on [github](https://github.com/zouzias/s3cmd) and contains a patch for downloading the arXiv dataset, see also [here](http://arxiv.org/help/bulk_data_s3).

### Configure AWS to access S3

Next you must configure AWS so that you can access S3. To do so, you need to generate an ACCESS_KEY and a SECRET_ACCESS_KEY. For more details, the reader is referred to [aws access key]().

Then, type
{% highlight bash %}
s3cmd --configure
{% endhighlight %}
to configure s3cmd with your credentials.

## Verify your setup

The following command should reply with `DIR   s3://arxiv/pdf/`
{% highlight bash %}
s3cmd ls --add-header="x-amz-request-payer: requester" s3://arxiv/pdf
{% endhighlight %}

## Download all papers

To download all latex source code of the papers, type

{% highlight bash %}
s3cmd get --add-header="x-amz-request-payer: requester" s3://arxiv/src/
{% endhighlight %}

Similary, to download all pdfs type

{% highlight bash %}
s3cmd get --add-header="x-amz-request-payer: requester" s3://arxiv/pdf/
{% endhighlight %}

### Estimate the download cost

In order to estimate the download cost, first check the current download rate on S3 per GB and it is also possible to calculate the size in GB of the download using s3cmd as follows

{% highlight bash %}
s3cmd ls --add-header="x-amz-request-payer: requester" s3://arxiv/src/\* > all_files.txt
awk '{s += $3}END  { print "sum is", s, " average is", s/NR }' all_files
{% endhighlight %}
