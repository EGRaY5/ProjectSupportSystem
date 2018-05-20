/*load student submited data as JSON Objects */
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

app.controller('progressReportMarkController', function($scope, $http) {
	$scope.insertProgressReportMarks = function() {
	console.log($scope.prMark);
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/InsertProgressReportMark',
		contentType: 'application/json',
		data : JSON.stringify($scope.prMark)
	}).then(function successCallback(data) {
		alert("Marks inserted Sucessfully");
		$scope.prMark.mark = null;
		$scope.displayDataPR();
		$scope.loadProgressReportList();
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

$scope.loadProgressReportList = function() {
	$scope.reportList = [];
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewProgressReportList'
	}).then(function successCallback(response) {
		$scope.reportList = response.data;
		console.log('success');
	}, function errorCallback(response) {
		console.log('error');
	});
}

});

app.controller('InterimMarkController', function($scope, $http) {
	$scope.insertInterimMark = function() {
	console.log($scope.intMark);
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/InsertInterimMark',
		contentType: 'application/json',
		data : JSON.stringify($scope.intMark)
	}).then(function successCallback(data) {
		alert("Marks inserted Sucessfully");
		$scope.intMark.title = null;
		$scope.intMark.abstract = null;
		$scope.intMark.intro = null;
		$scope.intMark.analysis = null;
		$scope.intMark.solution = null;
		$scope.intMark.totalmarks=null;
		$scope.displayInterimMark();
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
}

$scope.displayInterimMark = function() {
	$http({
		method : 'GET',
		url : 'http://localhost:8080/ProjectSupportSystem/DoViewInterimReport'
	}).then(function successCallback(response) {
		$scope.interim = response.data;
		console.log('sucess');
	}, function errorCallback(response) {
		console.log('error');
	});
}
});

app.controller('DissertationMarkController', function($scope, $http) {
	$scope.insertDissertation = function() {
	console.log($scope.disMark);
	$http({
		method : 'POST',
		url : 'http://localhost:8080/ProjectSupportSystem/InsertDissertationMark',
		contentType: 'application/json',
		data : JSON.stringify($scope.disMark)
	}).then(function successCallback(data) {
		alert("Marks inserted Sucessfully");
		$scope.disMark.introduction = null;
		$scope.disMark.analysis = null;
		$scope.disMark.design = null;
		$scope.disMark.implementation = null;
		$scope.disMark.evaluation = null;
		$scope.disMark.conclution = null;
		$scope.disMark.reference = null;
		$scope.disMark.appendices = null;
		$scope.disMark.general = null;
		$scope.disMark.total = null;
		$scope.displayDissertationMark();
		console.log(data);
	},function errorCallback(data) {
		console.log(data);
	});
}
	$scope.displayDissertationMark = function() {
		$http({
			method : 'GET',
			url : 'http://localhost:8080/ProjectSupportSystem/DoViewDissertation'
		}).then(function successCallback(response) {
			$scope.dissert = response.data;
			console.log('sucess');
		}, function errorCallback(response) {
			console.log('error');
		});
	}
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


