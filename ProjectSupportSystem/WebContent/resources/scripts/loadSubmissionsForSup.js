var app = angular.module('myApp', []);

app.controller('SupController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewSupervisor'
	}).then(function successCallback(response) {
		$scope.supervisor = response.data;
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('ProposalController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewProjectProposal'
	}).then(function successCallback(response) {
		$scope.proposal = response.data;
		
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('ClientController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewClient'
	}).then(function successCallback(response) {
		$scope.client = response.data;
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('DissertationController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewDissertation'
	}).then(function successCallback(response) {
		$scope.dissertation = response.data;
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('InterimController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem//DoViewInterimReport'
	}).then(function successCallback(response) {
		$scope.interim = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('ProgressController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewProgressReport'
	}).then(function successCallback(response) {
		$scope.progressreport = response.data;
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});

});

app.controller('PlanController', function($scope, $http) {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewProjectPlan'
	}).then(function successCallback(response) {
		$scope.plan = response.data;
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});

});





app.controller('SupervisorApprove', function($scope, $http) {
	
	$scope.insertApproval = function() {
		
	console.log($scope.comm);
	$scope.giveValue();
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/DoGiveApprove',
		contentType: 'application/json',
		data : JSON.stringify($scope.comm)
	}).then(function successCallback(data) {
		alert("supervisor approved");
		
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
	$scope.changeName();
}
	$scope.giveValue = function(){
		$scope.comm.report="supervisor";
	}
	
	$scope.changeName = function() {

    	document.getElementById("myText").disabled = true ;
    	document.getElementById("show").style.display = 'none' ;
    	
    	 }
	
});



app.controller('ProjectApprove', function($scope, $http) {
	
	$scope.insertApproval = function() {
		
	console.log($scope.comm);
	$scope.giveValue();
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/DoGiveApprove',
		contentType: 'application/json',
		data : JSON.stringify($scope.comm)
	}).then(function successCallback(data) {
		alert("project approved");
		
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
	$scope.changeName();
}
	$scope.giveValue = function(){
		$scope.comm.report="project";
	}
	
	$scope.changeName = function() {

    	document.getElementById("myText").disabled = true ;
    	document.getElementById("show").style.display = 'none' ;
    	
    	 }
	
});


app.controller('ClientApprove', function($scope, $http) {
	
	$scope.insertApproval = function() {
		
	console.log($scope.comm);
	$scope.giveValue();
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/DoGiveApprove',
		contentType: 'application/json',
		data : JSON.stringify($scope.comm)
	}).then(function successCallback(data) {
		alert("client approved");
		
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
	$scope.changeName();
}
	$scope.giveValue = function(){
		$scope.comm.report="client";
	}
	
	$scope.changeName = function() {

    	document.getElementById("myText").disabled = true ;
    	document.getElementById("show").style.display = 'none' ;
    	
    	 }
	
});


app.controller('ProgressApprove', function($scope, $http) {
	
	$scope.insertApproval = function() {
		
	console.log($scope.comm);
	$scope.giveValue();
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/DoGiveApprove',
		contentType: 'application/json',
		data : JSON.stringify($scope.comm)
	}).then(function successCallback(data) {
		alert("supervisor approved");
		
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
	$scope.changeName();
}
	$scope.giveValue = function(){
		$scope.comm.report="progress";
	}
	
	$scope.changeName = function() {

    	document.getElementById("myText").disabled = true ;
    	document.getElementById("show").style.display = 'none' ;
    	
    	 }
	
});









app.controller('InterimApprove', function($scope, $http) {
	
	$scope.insertApproval = function() {
		
	console.log($scope.comm);
	$scope.giveValue();
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/DoGiveApprove',
		contentType: 'application/json',
		data : JSON.stringify($scope.comm)
	}).then(function successCallback(data) {
		alert("interim report approved");
		
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
	$scope.changeName();
}
	$scope.giveValue = function(){
		$scope.comm.report="interim";
	}
	
	$scope.changeName = function() {

    	document.getElementById("myText").disabled = true ;
    	document.getElementById("show").style.display = 'none' ;
    	
    	 }
	
});


