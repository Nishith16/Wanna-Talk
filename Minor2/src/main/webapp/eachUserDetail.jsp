<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.myproject.entities.*"%>
<%@page import="com.myproject.dao.*"%>
<%@page import="com.myproject.helper.ConnectionProvider"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
int postid = Integer.parseInt(request.getParameter("postid"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postid);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous">
<title></title>
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Wanna Talk</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><input type="search" name="search"></li>
				<li class="nav-item active"><a class="nav-link" href="#">All
						Post<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="details.jsp"><span
						class="fa fa-user-circle"></span><%=" Hi," + user.getFirstname() + " " + user.getLastname()%></a>

				</li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-plus"></span> logout</a></li>
			</ul>
		</div>
	</nav>
	<%=postid%>
	<%
	UserDao ud = new UserDao(ConnectionProvider.getConnection());
	%>
	<!--  UserDetail-->
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-md-10 mt-5 pt-5">
				<div class="row z-depth-3">
					<div class="col-sm-4 bg-dark rounded-left">
						<div class="card-block text-center text-white">
							<img src="imgs/<%=ud.getUserByUserId(p.getUserid()).getProfile()%>"
								style="border-radius: 50%; width: 150px; height: 150px;">
							<h2 class="font-weight-bold mt-4"><%=ud.getUserByUserId(p.getUserid()).getFirstname()%></h2>
							<p><%=ud.getUserByUserId(p.getUserid()).getEmail()%></p>
							<br>
							<br>
							<br>

						</div>
					</div>
					<div class="col-sm-8 bg-white rounded-right">
						<h3 class="mt-3 text-center">Profile</h3>
						<hr class="badge-dark mt-0 w-25">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">ID</p>
								<h6 class="text-muted"><%=p.getUserid()%></h6>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Full Name</p>
								<h6 class="text-muted"><%=ud.getUserByUserId(p.getUserid()).getFirstname() +
								" " + ud.getUserByUserId(p.getUserid()).getLastname()%></h6>
							</div>
						</div>
						<br>
						<%if(!user.getFirstname().equals(ud.getUserByUserId(p.getUserid()).getFirstname())){ 
						
						%>
						<div class="row text-right mr-3">
							<div class="col-sm-6">
								<button class="btn btn-info btn-md" id="flwBtn" >Follow</button>
							</div>
						</div>
						<%} %>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<button class="btn btn-warning btn-md">Following</button>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-dark btn-md text-white"
									style="margin-left: 1rem; width: 3rem;">0</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-6">
								<button class="btn btn-success btn-md">Follower</button>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-dark btn-md text-white"
									style="margin-left: 1rem; width: 3rem;">0</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container mt-3">
		<div class="alert alert-info text-center" role="alert">
			Here are the posts of <%= ud.getUserByUserId(p.getUserid()).getFirstname() %>
		</div>
	</div>
	
<p class="ml-4" id="postcontent"></p>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		
	<script>
		$(document).ready(function (e){
			$.ajax({
	            url: "eachUserPost.jsp?userId=<%=p.getUserid()%>",
	            success: function (data, textStatus, jqXHR) {
	                console.log(data);
	                $("#postcontent").html(data);
	            }
			})
		})
	
	$(document).ready(function(){
		  $("#flwBtn").click(function(){
			  $(this).text($(this).text() == 'Follow' ? 'UnFollow' : 'Follow');
			  
		  });
		});
	</script>	
</body>
</html>