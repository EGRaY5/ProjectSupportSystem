/*handling submission links for stude*/

var app = angular.module('myApp', []);
	app.controller('progressController', function($scope, $http) {
	
		$scope.insertProgressData = function() {
			console.log($scope.progress);
			$http({
				method : 'POST',
				url : 'http://localhost:8080/ProjectSupportSystem/InsertProgressReportInfo',
				contentType: 'application/json',
				data : JSON.stringify($scope.progress)
			}).then(function successCallback(data) {
				$scope.progress.no = null;
				$scope.progress.enddate=null;
				$scope.progress.endtime=null;
				$scope.displayDataPR();
				console.log(data);
			},function errorCallback(data) {
				console.log(data);
			});
		}
		
		$scope.displayDataPR = function() {
			$scope.myArray = [];
			$http({
				method : 'GET',
				url : 'http://localhost:8080/ProjectSupportSystem/DoViewPReportDetailsList'
			}).then(function successCallback(response) {
				$scope.myArray = response.data;
				console.log('success');
			}, function errorCallback(response) {
				console.log('error');
			});
		}
		
		$scope.deletePRData = function(reportNo){
			if(confirm("Are you sure do you want to delete this data ?")){
				var repNo = {"reportNo":reportNo}
				$http({
					method : 'POST',
					url : 'http://localhost:8080/ProjectSupportSystem/DeleteProgressReportInfo',
					contentType: 'application/json',
					data : JSON.stringify(repNo)
				}).then(function successCallback(response) {
					console.log('success');
					$scope.displayDataPR();
				}, function errorCallback(response) {
					console.log('error');
				});
				
			}
			else{
				return false;
			}
		}
		
});
	
 /*form submission details*/
	
	app.controller('formController', function($scope, $http) {
		
		$scope.insertFormSubData = function() {
			console.log($scope.form);
			$http({
				method : 'POST',
				url : 'http://localhost:8080/ProjectSupportSystem/InsertFormsubInfo',
				contentType: 'application/json',
				data : JSON.stringify($scope.form)
			}).then(function successCallback(data) {
				$scope.form.type = null;
				$scope.form.enddate=null;
				$scope.form.endtime=null;
				$scope.displayDataForm();
				
			},function errorCallback (data) {
				console.log(data);
			});
			
		
		}
		$scope.displayDataForm = function() {
			$scope.myArray2 = [];
			$http({
				method : 'GET',
				url : 'http://localhost:8080/ProjectSupportSystem/DoViewFormDetailList'
			}).then(function successCallback(response) {
				$scope.myArray2 = response.data;
				console.log('success');
			}, function errorCallback(response) {
				console.log('error');
			});
		}
		
		$scope.deleteFormData = function(type){
			if(confirm("Are you sure do you want to delete this data ?")){
				var Indata = {"formType":type}
				$http({
					method : 'POST',
					url : 'http://localhost:8080/ProjectSupportSystem/DeleteFormsubInfo',
					contentType: 'application/json',
					data : JSON.stringify(Indata)
				}).then(function successCallback(response) {
					console.log('success');
					$scope.displayDataForm();
				}, function errorCallback(response) {
					console.log('error');
				});
				
			}
			else{
				return false;
			}
		}
		
		
		
});
	
	app.controller('messageController', function($scope, $http) {
		
		$scope.insertMessageData = function() {
			console.log($scope.message);
			$http({
				method : 'POST',
				url : 'http://localhost:8080/ProjectSupportSystem/InsertMessages',
				contentType: 'application/json',
				data : JSON.stringify($scope.message)
			}).then(function successCallback(data) {
				$scope.message.header = null;
				$scope.message.detail=null;
				$scope.displayMessages();
				console.log(data);
			},function errorCallback(data) {
				console.log(data);
			});
		}
		
		$scope.displayMessages = function() {
			$scope.myArray2 = [];
			$http({
				method : 'GET',
				url : 'http://localhost:8080/ProjectSupportSystem/DoViewMessagesList'
			}).then(function successCallback(response) {
				$scope.myArray2 = response.data;
				console.log('success');
			}, function errorCallback(response) {
				console.log('error');
			});
		}
		
		$scope.deleteMessage = function(msgId){
			if(confirm("Are you sure do you want to delete this data ?")){
				var msgId = {"msgId":msgId}
				$http({
					method : 'POST',
					url : 'http://localhost:8080/ProjectSupportSystem/DeleteMessages',
					contentType: 'application/json',
					data : JSON.stringify(msgId)
				}).then(function successCallback(response) {
					console.log('success');
					$scope.displayMessages();
				}, function errorCallback(response) {
					console.log('error');
				});
				
			}
			else{
				 return false;
			}
		}
	});
	

	
	
	/*app.controller('reportListController', function($scope, $http) {
		$scope.myArray = [];
		$http({
			method : 'GET',
			url : 'http://localhost:8080/ProjectSupportSystem/DoViewPReportDetailsList'
		}).then(function successCallback(response) {
			$scope.myArray = response.data;
			console.log('success');
		}, function errorCallback(response) {
			console.log('error');
		});

	});
	
	
	app.controller('formSubListController', function($scope, $http) {
		$scope.myArray = [];
		$http({
			method : 'GET',
			url : 'http://localhost:8080/ProjectSupportSystem/DoViewFormDetailList'
		}).then(function successCallback(response) {
			$scope.myArray2 = response.data;
			console.log('success');
		}, function errorCallback(response) {
			console.log('error');
		});

	});
	*/
	