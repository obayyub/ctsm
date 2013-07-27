var app = angular.module('ctsm', []);

app.factory('Feed', ['$http', function ($http) {
    return {
        parseFeed: function (url) {
            return $http.jsonp('//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=50&callback=JSON_CALLBACK&q=' + encodeURIComponent(url));
        }
    }
}]);

var FeedCtrl = function($scope, Feed) {
	Feed.parseFeed('http://feed.eng.umd.edu/news/feed.xml').then(function (res) {
      $scope.feeds = res.data.responseData.feed.entries;
      console.log($scope.feeds);
   });
}

var PublicationCtrl = function($scope) {
	$scope.selection = 'journal';
	$scope.switchView = function(whichView) {
		$scope.selection = whichView;
	}
};