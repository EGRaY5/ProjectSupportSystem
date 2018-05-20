var app = angular.module('PRApp', []);
app.controller('progressReportMarkController', function($scope, $http) {
		$scope.insertProgressReportMarks = function() {
		console.log($scope.prMark);
		$http({
			method : 'POST',
			url : 'http://localhost:8080/ProjectSupportSystem/InsertProgressReportMark',
			contentType: 'application/json',
			data : JSON.stringify($scope.prMark)
		}).then(function successCallback(data) {
			$scope.prMark.mark = null;
			$scope.displayDataPR();
			console.log(data);
		},function errorCallback(data) {
			console.log(data);
		});
	}
	
	$scope.displayDataPR = function() {
		$http({
			method : 'GET',
			url : 'http://localhost:8080/ProjectSupportSystem/DoViewProgressReportMarks'
		}).then(function successCallback(response) {
			$scope.marks = response.data;
			console.log('sucess');
		}, function errorCallback(response) {
			console.log('error');
		});
	}
	


	
});

