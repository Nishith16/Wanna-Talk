<%@page import="com.myproject.helper.ConnectionProvider"%>
<%@page import="java.nio.channels.ConnectionPendingException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/login.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

</head>
<body>	

	<% 
		Connection con = ConnectionProvider.getConnection();
	%>
		<section>
		   <%--!<div class="container">
		     <div class="row justify-content-center">
		       <div class="col-12 col-md-8 col-lg-8 col-xl-6">
		          <div class="row">
		            <div class="col text-center">
		              <h1>Register</h1>
		              <p class="text-h3">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia. </p>
		            </div>
		          </div>
		          <form action="RegisterServlet" method="post" id="reg-form">
			          <div class="row align-items-center">
			            <div class="col mt-4">
			              <input type="text" class="form-control" placeholder="Name" name="username" required>
			            </div>
			          </div>
			          <div class="row align-items-center mt-4">
			            <div class="col">
			              <input type="email" class="form-control" placeholder="Email" name = "useremail" required>
			            </div>
			          </div>
			          <div class="row align-items-center mt-4">
			            <div class="col">
			              <input type="password" class="form-control" placeholder="Password" name="userpassword" required>
			            </div>
			          </div>
			          <div class="row justify-content-start mt-4">
			              <button class="btn btn-primary mt-4">Submit</button>
			          </div>
		          </form> 
		          </div>
		        </div>
		      </div>--%>
		      
		      
		      
		      
	<div class="login-dark" style="height: 695px;">
        <form action="RegisterServlet" method="post" id="reg-form">
            <h2 class="sr-only">Sign Up</h2>
            
            <div class="illustration"><i class="icon ion-ios-chatbubbles-outline"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="firstname" placeholder="First Name" required>
            </div>
            <div class="form-group"><input class="form-control" type="text" name="lastname" placeholder="Last Name" required>
            </div>
            <div class="form-group"><input class="form-control" type="text" name="useremail" placeholder="Nickname" required>
            </div>
            <div class="form-group"><input class="form-control" type="password" name="userpassword" placeholder="Password" required>
            </div>
            <div class="form-group"><button class="btn btn-dark btn-block" style="border-radius: 1px;">Sign Up</button></div>
        </form>
    </div>
	</section>
	<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
	<script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		<script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                           
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
</body>
</html>