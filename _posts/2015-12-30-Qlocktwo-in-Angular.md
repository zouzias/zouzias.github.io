---
layout: post
title: Qlocktwo In Angular (Javascript)
tags:
- javascript
- angular
- web
- yeoman
- art
---

In this post, we provide details on an AngularJS implementation of [Qlocktwo](http://www.qlocktwo.com/).

A [demo](http://qlocktwo.herokuapp.com) is deployed on Heroku.

# Development

## Setup the environment

First, you must install the javascript toolkit of `nodejs`, `bower`, `grunt` and `yeoman`, see for instructions [here](http://yeoman.io/learning/index.html).

## Fetch code from Github
Second, fetch the source code from GitHub

{% highlight bash %}
git clone https://github.com/zouzias/qlocktwo-angular.git
cd qlocktwo-angular
npm install
bower install
grunt serve
{% endhighlight %}

# Code

### Services

There are three services: `CurrentTimeService`, `LetterGridService` and `TimeToPhrases`.

The `CurrentTimeService` is responsible for emitting an event every 10 seconds to update the state of the controller of Qlocktwo.

The `LetterGridService` is responsible for the initial loading of the letter grid in the controller of Qlocktwo's view, i.e., load the letter grid.

The service `TimeToPhrases` contains a mapping from hours to words describing hours, i.e., `1` maps to `one` as well as a similar mapping for minutes, i.e., `10` maps to "ten", etc.

### Controller

The main controller is the `QlocktwoCtrl` which is responsible for storing and updating the state of the Qlocktwo letter grid in `$scope.grid`.

To achieve the updates, the controller listens on the event `TIME_UPDATED` to update the letter grid. The `TIME_UPDATED` event is emitted from the `CurrentTimeService` service every 10 seconds. On the `TIME_UPDATED` event, the controller calls `updateTimePhrases()` which in turn resets the letter grid and then highlights the letters corresponding to the update time.

The update of the time is done with the following code segment (quoted from the method `updateTimePhrases`)

{% highlight javascript %}
var loc = $scope.highlightWord($scope.currentHour, 0, 0);
$scope.highlightWord($scope.currentMinute, loc.row, loc.col);
{% endhighlight %}

The first line highlights the first occurrence of the current hours word (say, "five"). The second line highlights the first occurrence of the current minutes (say, "twenty") following the hour word (see last two arguments of function).

### Qlocktwo main View

The main view of the Qlocktwo clock is an HTML5 table element that is populated from the `grid` variable of its controller.

{% highlight html %}
<table class="table table-responsive fill">
    <tbody>
        <tr ng-repeat="row in grid">
            <td ng-repeat="c in row track by $index">
              <div class="text-center letter-font"
              ng-style="{opacity : (c.selected && '1') || '0.15'}">
              {% raw %}{{c.char}}{% endraw %}
              </div>
            </td>
        </tr>
</table>
{% endhighlight %}

For the i-th row of the `grid` variable and for the j-th column of the i-th row, check is (i,j)-element is selected, and if so highlight it. As simply as that.

## References

For more details, see [Qlocktwo](https://github.com/zouzias/qlocktwo-angular.git).

On how to deploy a Yeoman application to heroku, see [Yeoman to Heroku](https://github.com/zouzias/qlocktwo-angular-deploy.git).
