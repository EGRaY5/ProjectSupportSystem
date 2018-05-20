var app = angular.module('myApp', []);
/*retrieve question list*/
app.controller('MyController1', function($scope, $http) {
	/*Stores the data got from DoViewAnswerList in scope.quest*/
	$scope.quest = [];
	$http({
		method : 'GET',
		/*File from which json data is received*/
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewAnswerList'
	}).then(function successCallback(response) {
		$scope.quest = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});
	
});




