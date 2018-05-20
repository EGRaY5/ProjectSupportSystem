var app = angular.module('myApp', []);
/*retrive student list*/
app.controller('MyController', function($scope, $http) {
	$scope.myArray = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewStudentList'
	}).then(function successCallback(response) {
		$scope.myArray = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});

/*insert interim report  data*/
app.controller('InterimSubmitted', function($scope, $http) {
	$scope.intArray = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewInterimSubmittedStudentList'
	}).then(function successCallback(response) {
		$scope.intArray = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('InterimNotSubmitted', function($scope, $http) {
	$scope.notIntArray = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewInterimNotSubmitedList'
	}).then(function successCallback(response) {
		$scope.notIntArray = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('DissertationSubmitted', function($scope, $http) {
	$scope.disArray = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewDissertationSubmittedList'
	}).then(function successCallback(response) {
		$scope.disArray = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});


app.controller('DissertationNotSubmitted', function($scope, $http) {
	$scope.notDisArray = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewDissertationNotSubmittedList'
	}).then(function successCallback(response) {
		$scope.notDisArray = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});


