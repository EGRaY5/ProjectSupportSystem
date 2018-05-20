var app = angular.module('myApp', []);
app.controller('messageController', function($scope, $http) {
	
	$scope.insertVivaMember = function() {
		console.log($scope.viva);
		$http({
			method : 'POST',
			url : 'http://localhost:8080/ProjectSupportSystem/InsertVivaMember',
			contentType: 'application/json',
			data : JSON.stringify($scope.viva)
		}).then(function successCallback(data) {
			$scope.viva.id = null;
			$scope.viva.fname = null;
			$scope.viva.lname = null;
			$scope.viva.email = null;
			$scope.viva.department = null;
			$scope.viva.role = null;
			console.log(data);
		},function errorCallback(data) {
			console.log(data);
		});
	}
});