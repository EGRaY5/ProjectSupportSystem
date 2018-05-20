var app = angular.module('myApp', []);
/*retrieve answer list*/
app.controller('MyController2', function($scope, $http) {
	$scope.reply = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewAnswerList'
	}).then(function successCallback(response) {
		$scope.reply = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});