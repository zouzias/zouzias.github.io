---
layout: post
title: "Introduction to Grunt"
tags:
- javascript
- node
- nodejs
- bower
- web
---

In this post, we will introduce [Grunt](http://gruntjs.com/). Grunt is a tool that helps web developers to automate the web development process. Here we focus on javascript code minification, concatenation and code quality check ([JShint](https://en.wikipedia.org/wiki/JSHint)).

## Install NodeJS and Grunt

First, you need to install [nodejs](https://nodejs.org/). Nodes ships with npm which is a module manager for nodejs applications.

After you installed nodejs and npm successfully (to verify type `node -v` and `npm -v`, respectively), install grunt with

{% highlight bash %}
sudo npm install -g grunt grunt-cli
{% endhighlight %}

The `-g` option tells npm to install grunt and grunt command line interface (grunt-cli) globally.

### Minifying Javascript code

First, we describe a simple grunt example that minifies Javascript. We use the `grunt-contrib-uglify` task for this task.

{% highlight javascript %}
module.exports = function(grunt){
	grunt.initConfig({
		uglify: {
			options: {
				mangle: true,
				compress: true,
				sourceMap: "dist/application.map",
				banner: "/* Anastasios Zouzias 2015*/\n"
			},
			target: {
				src: "src/application.js",
				dest: "dist/application.min.js"
			},
			util: {
				src: "src/util.js",
				dest: "dist/util.min.js"
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');
}
{% endhighlight %}

### JSHint, minify and concatenate a list of JS files

A common task during web development is to check the quality of javascript code then concatenate all javascript files together and finally minify them as an `application.min.js`.

{% highlight javascript %}
module.exports = function(grunt){
	grunt.initConfig({
		uglify: { /* Minifies JS code */
			options: {
				mangle: true,
				compress: true,
				sourceMap: 'dist/application.map',
				banner: '/* Anastasios Zouzias 2015*/\n'
			},
			target: {
				src: 'dest/application.js',
				dest: 'dist/application.min.js'
			}
		},
		jshint: { /* Checks Javascript for error */
			options : {
				eqeqeq : true, /* Only ===, not ==*/
				curly: true,  /* Use curly everywhere*/
				undef: true
			},
			target: {
				src : 'src/*.js'
			}
		},
		concat: { /* Concats the following files to dest/application.js */
			options: {
				seperator: ';'
			},
			target: {
				src: ['src/application.js', 'src/util.js'],
				dest: 'dest/application.js'
			}
		},
		clean: { /* Clean dest and dist directories*/
			target: ['dist', 'dest']
		}
	});

	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-clean');

	/* Run tasks : jshint, concat and uglify*/
	grunt.registerTask('default', ['jshint', 'concat', 'uglify']);
	grunt.registerTask('rebuild', ['clean', 'default']);

}
{% endhighlight %}


### Source code

The source code is available at [GitHub](https://github.com/zouzias/grunt-examples).
