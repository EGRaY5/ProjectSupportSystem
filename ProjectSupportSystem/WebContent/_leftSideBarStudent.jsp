<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.projectsupport.services.SystemUtilServices"%>
<%@ page import="com.projectsupport.services.MyUtils"%>
<%@ page import="com.projectsupport.services.ProgressReportServices"%>
<%@ page import="com.projectsupport.models.FormSub"%>
<%@ page import="com.projectsupport.models.ProgressReportSub"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.Duration"%>

	<ul class="nav flex-column">
			<!-- <li class="nav-item">
				<a class="nav-link active" href="ShowSupervisorFeedBack"> Supervisor Feedback </a>
		 	</li> -->
				<% //checking the deadline has passed or not
					String errorString = null;
					Connection conn = MyUtils.getStoredConnection(request);
					List<FormSub> formList = null;
					try {
						formList = SystemUtilServices.findFormSub(conn);

					} catch (SQLException e) {
						e.printStackTrace();
					}
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Date currentdate = new Date();
					Calendar cal = Calendar.getInstance();
					SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
					//System.out.println(sdf1.format(cal.getTime()));

					for (int i = 0; i < formList.size(); i++) {
						//System.out.println(formList.get(i).getEndDate().toString());
						if (formList.get(i).getFormType().equals("Supervisor Details")) {
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							Date d1 = sdf.parse(formList.get(i).getEndDate());
							long diff = (d1.getTime() - currentdate.getTime()) / (24 * 60 * 60 * 1000);
							LocalTime time = LocalTime.parse(formList.get(i).getEndTime());
							LocalTime currentTime = LocalTime.parse(sdf1.format(cal.getTime()));
							Duration supdur = Duration.between(currentTime, time);
							Duration supheck = Duration.between(time, currentTime);

							if (supdur.toMinutes() < 0) {
								String showingTime = supheck.toString().substring(2);
								String timeRemainingSup = "You have Days:" + diff + " Time:" + showingTime;
								session.setAttribute("timeRemainingSup", timeRemainingSup);
							} else {
								String showingTime = supdur.toString().substring(2);
								String timeRemainingSup = "You have Days:" + diff + " Time: " + showingTime;
								session.setAttribute("timeRemainingSup", timeRemainingSup);
							}

							if (d1.after(currentdate)) {
								out.print(
										"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindSupervisor\">Supervisor Details </a></li>");
							} else if (d1.equals(currentdate)) {
								if (supdur.toMinutes() > 0) {
									out.print(
											"<li class=\"nav-item active\"><a class=\"nav-link\" href=\"FindSupervisor\">Supervisor Details </a></li>");
								}
							}

						}
						if (formList.get(i).getFormType().equals("Client Details")) {
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							Date d1 = sdf.parse(formList.get(i).getEndDate());
							long diff = (d1.getTime() - currentdate.getTime()) / (24 * 60 * 60 * 1000);
							LocalTime time = LocalTime.parse(formList.get(i).getEndTime());
							LocalTime currentTime = LocalTime.parse(sdf1.format(cal.getTime()));
							Duration clientdur = Duration.between(currentTime, time);
							Duration clientheck = Duration.between(time, currentTime);

							if (clientdur.toMinutes() < 0) {
								String showingTime = clientheck.toString().substring(2);
								String timeRemainingClient = "You have Days:" + diff + " Time:" + showingTime;
								session.setAttribute("timeRemainingClient", timeRemainingClient);
							} else {
								String showingTime = clientdur.toString().substring(2);
								String timeRemainingClient = "You have Days:" + diff + " Time: " + showingTime;
								session.setAttribute("timeRemainingClient", timeRemainingClient);
							}

							if (d1.after(currentdate)) {
								out.print(
										"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindClient\"> Client Details </a></li>");
							} else if (d1.equals(currentdate)) {
								if (clientdur.toMinutes() > 0) {
									out.print(
											"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindClient\"> Client Details </a></li>");
								}
							}
						}
						if (formList.get(i).getFormType().equals("Project Proposal")) {
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							Date d1 = sdf.parse(formList.get(i).getEndDate());
							long diff = (d1.getTime() - currentdate.getTime()) / (24 * 60 * 60 * 1000);
							LocalTime time = LocalTime.parse(formList.get(i).getEndTime());
							LocalTime currentTime = LocalTime.parse(sdf1.format(cal.getTime()));
							Duration proposaldur = Duration.between(currentTime, time);
							Duration proposalheck = Duration.between(time, currentTime);
							if (proposaldur.toMinutes() < 0) {
								String showingTime = proposalheck.toString().substring(2);
								String timeRemainingProposal = "You have Days:" + diff + " Time:" + showingTime;
								session.setAttribute("timeRemainingProposal", timeRemainingProposal);
							} else {
								String showingTime = proposaldur.toString().substring(2);
								String timeRemainingProposal = "You have Days:" + diff + " Time: " + showingTime;
								session.setAttribute("timeRemainingProposal", timeRemainingProposal);
							}

							if (d1.after(currentdate)) {
								out.print(
										"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindProjectProposal\">Project Proposal</a></li>");
							} else if (d1.equals(currentdate)) {
								if (proposaldur.toMinutes() > 0) {
									out.print(
											"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindProjectProposal\">Project Proposal</a></li>");
								}
							}
						}
						if (formList.get(i).getFormType().equals("Interim Report")) {
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							Date d1 = sdf.parse(formList.get(i).getEndDate());
							long diff = (d1.getTime() - currentdate.getTime()) / (24 * 60 * 60 * 1000);
							LocalTime time = LocalTime.parse(formList.get(i).getEndTime());
							LocalTime currentTime = LocalTime.parse(sdf1.format(cal.getTime()));
							Duration interimdur = Duration.between(currentTime, time);
							Duration interimheck = Duration.between(time, currentTime);

							if (interimdur.toMinutes() < 0) {
								String showingTime = interimheck.toString().substring(2);
								String timeRemainingInterim = "You have Days:" + diff + " Time:" + showingTime;
								session.setAttribute("timeRemainingInterim", timeRemainingInterim);
							} else {
								String showingTime = interimdur.toString().substring(2);
								String timeRemainingInterim = "You have Days:" + diff + " Time: " + showingTime;
								session.setAttribute("timeRemainingInterim", timeRemainingInterim);
							}

							if (d1.after(currentdate)) {
								out.print(
										"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindInterimReport\" >Interim Report</a></li>");
							} else if (d1.equals(currentdate)) {
								if (interimdur.toMinutes() > 0) {
									out.print(
											"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindInterimReport\" >Interim Report</a></li>");
								}
							}
						}
						if (formList.get(i).getFormType().equals("Dissertation")) {
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							Date d1 = sdf.parse(formList.get(i).getEndDate());
							long diff = (d1.getTime() - currentdate.getTime()) / (24 * 60 * 60 * 1000);
							LocalTime time = LocalTime.parse(formList.get(i).getEndTime());
							LocalTime currentTime = LocalTime.parse(sdf1.format(cal.getTime()));
							Duration dissdur = Duration.between(currentTime, time);
							Duration dissheck = Duration.between(time, currentTime);

							if (dissdur.toMinutes() < 0) {
								String showingTime = dissheck.toString().substring(2);
								String timeRemainingDiss = "You have Days:" + diff + " Time:" + showingTime;
								session.setAttribute("timeRemainingDiss", timeRemainingDiss);
							} else {
								String showingTime = dissdur.toString().substring(2);
								String timeRemainingDiss = "You have Days:" + diff + " Time: " + showingTime;
								session.setAttribute("timeRemainingDiss", timeRemainingDiss);
							}
							if (d1.after(currentdate)) {
								out.println(
										"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindDissertation\">Dissertation</a></li>");
							} else if (d1.equals(currentdate)) {
								if (dissdur.toMinutes() > 0) {
									out.println(
											"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindDissertation\">Dissertation</a></li>");
								}
							}
						}

					}
					//checking the deadline has passed or not in progress reports
					ProgressReportSub prsub = null;
					try {
						prsub = ProgressReportServices.findLatestReport(conn);
						int reportNo = prsub.getReportNo();
						session.setAttribute("reportNo",reportNo);
					} catch (SQLException e) {
						e.printStackTrace();
						errorString = e.getMessage();

					}
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date d1 = sdf.parse(prsub.getEndDate());
					long diff = (d1.getTime() - currentdate.getTime()) / (24 * 60 * 60 * 1000);
					LocalTime time = LocalTime.parse(prsub.getEndTime());
					LocalTime currentTime = LocalTime.parse(sdf1.format(cal.getTime()));
					Duration progressdur = Duration.between(currentTime, time);
					Duration progressheck = Duration.between(time, currentTime);
					if (progressdur.toMinutes() < 0) {
						String showingTime = progressheck.toString().substring(2);
						String timeRemainingProgress = "You have Days:" + diff + " Time:" + showingTime;
						session.setAttribute("timeRemainingProgress", timeRemainingProgress);
					} else {
						String showingTime = progressdur.toString().substring(2);
						String timeRemainingProgress = "You have Days:" + diff + " Time: " + showingTime;
						session.setAttribute("timeRemainingProgress", timeRemainingProgress);
					}
					
					
					if (d1.after(currentdate)) {
						out.println(
								"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindProgressReport\"> Progress Report</a></li>");
					} else if (d1.equals(currentdate)) {
						if (progressdur.toMinutes() > 0) {
							out.println(
									"<li class=\"nav-item\"><a class=\"nav-link active\" href=\"FindProgressReport\"> Progress Report</a></li>");
						}
					}
				%>
				
				<li class="nav-item">
  					<a class="nav-link" href="ShowForum">Forum</a>
  				</li>





				<!-- <li class="nav-item"><a class="nav-link" href="FindSupervisor">
						Supervisor Details </a></li>
				
				<li class="nav-item"><a class="nav-link" href="FindClient">
						Client Details </a></li>
			
				<li class="nav-item"><a class="nav-link" href="FindProjectProposal">Project Proposal</a></li>
				<li class="nav-item"><a class="nav-link" href="FindProgressReport"> Progress Report</a></li>
				<li class="nav-item"><a class="nav-link" href="FindInterimReport" >Interim Report</a></li>
				<li class="nav-item"><a class="nav-link" href="FindDissertation">Dissertation</a></li>
				<li class="nav-item"><a class="nav-link" href=""
					onclick="loadMedical(); return false;"> Medical</a></li>
 -->
			</ul>


<!-- <li class="nav-item"> <a class="dropdown-toggle"
data-toggle="dropdown" href="">Client Details <span class="caret"></span> </a>
					<ul class="dropdown-menu">
						<li><a href="" onclick="addClient(); return false;"> add
								Client</a></li>
						<li><a href="" id="viewSupervisor"> Edit/View Client
								Certifiate</a></li>
						<li><a href=""> view Client Details </a> </li>

					</ul></li> -->
