---
layout: post
title: "Elasticsearch: Unassigned Shards Problem"
---

During index creation in some cases elasticsearch fails to assign properly its shards. Usually, this issue arises when the cluster runs out of space. If it happens to run your cluster in production, you might want to force elasticsearch to reassign its shards, execute the following command on every node of the cluster.

First, you should make sure that your cluster has enough space to perform the shard reassignment (>10% free space). To do so, you should free up some space by deleting unecessary indices or files.

Second, you can force elasticsearch to perform the reassignment of the shards by the following command.

{% highlight bash %}
HOSTS=server1.example.com,server2.example.com,...,serverN.example.com

for HOST in HOSTS
do
	# v1.0+
    curl -XPUT '${HOST}:9200/_settings' \
    -d '{"index.routing.allocation.disable_allocation": false}'
done

{% endhighlight %}

If the above command fails, check the logs. If you see a similar log as the one below you might need to free up more space.

{% highlight text %}
[2015-03-17 17:27:05,694][WARN ][cluster.routing.allocation.decider] [es1-dev-strong-es-01] 
After allocating, node [Ym_7Q-4pTJOZIztpmQLDuQ] 
would have less than the required 10.0% free disk threshold (8.396659874772283% free),
{% endhighlight %}

The above has been tested under elasticsearch v.1.3.7.

### References

1. [Stackoverflow](http://stackoverflow.com/questions/19967472/elasticsearch-unassigned-shards-how-to-fix) for more discussion on this issue.
