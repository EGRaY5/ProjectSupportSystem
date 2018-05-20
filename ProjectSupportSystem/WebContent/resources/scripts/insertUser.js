var app = angular.module('myApp', []);
app.controller('messageController', function($scope, $http) {
	
	$scope.insertUserData = function() {
		console.log($scope.user);
		$http({
			method : 'POST',
			url : 'http://localhost:8080/ProjectSupportSystem/InsertUser',
			contentType: 'application/json',
			data : JSON.stringify($scope.user)
		}).then(function successCallback(data) {
			$scope.user.name = null;
			$scope.user.password=null;
			$scope.user.position=null;
			$scope.displayUsers();
			console.log(data);
		},function errorCallback(data) {
			console.log(data);
		});
	}
	$scope.displayUsers = function() {
		$scope.myArray2 = [];
		$http({
			method : 'GET',
			url : 'http://localhost:8080/ProjectSupportSystem/DoViewUsersList'
		}).then(function successCallback(response) {
			$scope.myArray2 = response.data;
			console.log('success');
		}, function errorCallback(response) {
			console.log('error');
		});
	}
	$scope.deleteUser = function(userName){
		if(confirm("Are you sure do you want to delete this data ?")){
			var userName = {"userName":userName}
			$http({
				method : 'POST',
				url : 'http://localhost:8080/ProjectSupportSystem/DeleteUsers',
				contentType: 'application/json',
				data : JSON.stringify(userName)
			}).then(function successCallback(response) {
				console.log('success');
				$scope.displayUsers();
			}, function errorCallback(response) {
				console.log('error');
			});
			
		}
		else{
			 return false;
		}
	}
	$scope.editUser = function() {
		$scope.myArray2 = [];
		$http({
			method : 'GET',
			url : 'http://localhost:8080/ProjectSupportSystem/EditUsers'
		}).then(function successCallback(response) {
			$scope.myArray2 = response.data;
			console.log('success');
		}, function errorCallback(response) {
			console.log('error');
		});
	}
	
});