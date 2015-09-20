---
layout: post
title: "Convert XML to JSON (Java)"
tags:
- java
- xml
- json
---

In this post, we present how to convert an XML document into JSON. In most cases, working with JSON documents is much more preferable compared to working with XML documents. To do so, we will make use of the following library.

A full maven example using arxiv's metadata XML is available on [github](https://github.com/zouzias/xmltojson-java).


{% highlight xml %}
<dependency>
    <groupId>org.json</groupId>
    <artifactId>json</artifactId>
    <version>20140107</version>
</dependency>
{% endhighlight %}

Utilizing the above library the convetion is pretty straighforward, i.e.,

{% highlight java %}
int PRETTY_PRINT_INDENT_FACTOR = 4;
File file = new File("arxivMetadata.xml");
// Convert file contents to string
String contents = FileUtils.readFileToString(file);
// Convert XML to JSON
JSONObject xmlJSONObj = XML.toJSONObject(contents);
// Print XML to papers.json
String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
PrintWriter writer = new PrintWriter("papers.json");
writer.write(jsonPrettyPrintString);
writer.close();
{% endhighlight %}

The above code reads the XML file `arxivMetadata.xml`, converts it to string using commons-io, then converts it to a JSONObject and finally prints the JSON to `papers.json`.


### References

* [JSON.org](http://www.json.org/java/)
* [Stackoverflow](http://stackoverflow.com/questions/1823264/quickest-way-to-convert-xml-to-json-in-java)
