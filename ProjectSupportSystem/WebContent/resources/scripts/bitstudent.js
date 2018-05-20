/*calling doViewMessageList controller and return that Json to the jsp*/
var app = angular.module('myApp', []);
 app.controller('viewMessages', function($scope, $http) {
	$scope.myArray = [];
			$http({
				method : 'GET',
				url : 'http://localhost:8080/ProjectSupportSystem/DoViewMessagesList'
			}).then(function successCallback(response) {
				$scope.myArray = response.data;
				console.log('success');
			}, function errorCallback(response) {
				console.log('error');
			});
		
	 

 
 });
 
 
 
 
 
 /*function addSupervisor() {
 var xhttp = new XMLHttpRequest();
 xhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
    document.getElementById("formload").innerHTML = this.responseText;
   }
 };
 xhttp.open("GET", "student/addsupervisor.jsp", true);
 xhttp.send();

} 

function addClient() {
 var xhttp = new XMLHttpRequest();
 xhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
    document.getElementById("formload").innerHTML = this.responseText;
   }
 };
 xhttp.open("GET", "student/addClient.html", true);
 xhttp.send();
}

function progressReport() {
 var xhttp = new XMLHttpRequest();
 xhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
    document.getElementById("formload").innerHTML = this.responseText;
   }
 };
 xhttp.open("GET", "student/progressReport.html", true);
 xhttp.send();
}

function proposal() {
 var xhttp = new XMLHttpRequest();
 xhttp.onreadystatechange = function() {
   if (this.readyState == 4 && this.status == 200) {
    document.getElementById("formload").innerHTML = this.responseText;
   }
 };
 xhttp.open("GET", "student/proposal.html", true);
 xhttp.send();
}

function loadInterim() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("formload").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "student/interim.html", true);
	  xhttp.send();
	}

function loadDissertation() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("formload").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "student/dissertation.html", true);
	  xhttp.send();
	}*/

/*function loadMedical() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("formload").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "student/medical.html", true);
	  xhttp.send();
}

/*function viewSupervisor() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("formload").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "student/viewSupervisor.jsp", true);
	  xhttp.send();
} 
*/

 



