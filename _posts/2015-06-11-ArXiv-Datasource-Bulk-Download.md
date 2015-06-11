---
layout: post
title: "Bulk Download of ArXiv's Repository"
tags:
- opendata
- aws
- bigdata
---

In this post, we demostrate step-by-step how to download all papers from [ArXiv](). ArXiv is an open access repository in which researchers can share their manuscripts before submission to a conference or journal.

The ArXiv dataset is available on Amazon's S3 cloud storage and it is not freely available. TODO: estimate cost of downloading all papers.

This post is a distillation of the following [page](http://arxiv.org/help/bulk_data_s3).

### Install python and s3cmd

First, install python. To access amazon's S3, we will use a forked version of [s3cmd]() which is available on [github](https://github.com/zouzias/s3cmd) and contains a patch for downloading the arXiv dataset. 


### Configure AWS to access S3

Now, you must configure AWS so that you can access S3. To do so, you need to generate an ACCESS_KEY and a SECRET_ACCESS_KEY. To do so, instructions on aws...

Then, type
{% highlight bash %}
s3cmd --configure
{% endhighlight %}
to configure s3cmd with your credentials.

### Verify your setup

The following command should reply with `DIR   s3://arxiv/pdf/`
{% highlight bash %}
s3cmd ls --add-header="x-amz-request-payer: requester" s3://arxiv/pdf
{% endhighlight %}

### Download all papers

To download all latex source code of the papers, type

{% highlight bash %}
s3cmd get --add-header="x-amz-request-payer: requester" s3://arxiv/src/
{% endhighlight %}

Similary, to download all pdfs type

% highlight bash %}
s3cmd get --add-header="x-amz-request-payer: requester" s3://arxiv/pdf/
{% endhighlight %}
