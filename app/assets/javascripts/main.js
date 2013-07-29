var app = angular.module('ctsm', ['ngResource']);

app.factory('Feed', ['$http', function ($http) {
    return {
        parseFeed: function (url) {
            return $http.jsonp('//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=50&callback=JSON_CALLBACK&q=' + encodeURIComponent(url));
        }
    }
}]);

app.factory('Articles', function($resource) {
  return $resource("/articles/:id", {id: "@id"}, {update: {method: "PUT"}});
});

var FeedCtrl = function($scope, Feed) {
	Feed.parseFeed('http://feed.eng.umd.edu/news/feed.xml').then(function (res) {
      $scope.feeds = res.data.responseData.feed.entries;
   });
}

var PublicationCtrl = function($scope) {
	$scope.selection = 'journal';
	$scope.switchView = function(whichView) {
		$scope.selection = whichView;
	}
};

var ArticlesCtrl = function($scope, Articles) {
  articles = Articles.query(function() {
    $scope.articles = articles;
  });
}