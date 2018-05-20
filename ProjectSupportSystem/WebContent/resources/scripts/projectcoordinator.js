function loadStudentList() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     document.getElementById("formload").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "projectcoordinator/studentlist.jsp", true);
  xhttp.send();
}