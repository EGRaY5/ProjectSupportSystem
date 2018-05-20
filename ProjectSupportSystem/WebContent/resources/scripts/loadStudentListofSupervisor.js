var app = angular.module('myApp', []);

app.controller('MyController', function($scope, $http) {
	$scope.myArray = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewStudentsofSupervisor'
	}).then(function successCallback(response) {
		$scope.myArray = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});