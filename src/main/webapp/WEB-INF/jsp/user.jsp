<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>


<!-- Bootstrap CSS -->
<!-- Latest compiled and minified CSS -->
<!-- validation -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<script
	src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.2/js/toastr.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>


</head>
<body>


	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">User Registration</div>
				<div class="panel-body">
					<div class="col-md-4"></div>
					<div class="col-md-4">

						<form action="${pageContext.request.contextPath}/rest/saveUser"
							method="POST" id="demoForm">

							<input type="hidden" name="id" id="id" />

							<div class="form-group">
								<label>First Name</label> <input class="form-control"
									type="text" name="firstName" id="firstName" />
							</div>

							<div class="form-group">
								<label>Last Name</label> <input class="form-control" type="text"
									name="lastName" id="lastName" />
							</div>

							<div class="form-group">
								<label>Date Of Birth</label> <input class="form-control"
									name="dateOfBirth" id="dateOfBirth" />
							</div>

							<div class="form-group">
								<label>Username </label> <input class="form-control"
									name="username" id="username" />
							</div>

							<div class="form-group">
								<label>Email </label> <input class="form-control" name="email"
									id="email" />
							</div>

							<div class="form-group">
								<label>Password </label> <input class="form-control"
									name="password" id="password" />
							</div>

							<div class="form-group">
								<button type="button" class="submit" id="submit"
									class="btn blue">Save</button>
							</div>

							<div class="form-group">
								<a href="${pageContext.request.contextPath}/viewUser">View
									User Details</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>


<script type="text/javascript">
	$(function() {
	});

	$("#submit").click(function() {
		if ($('#firstName').val().trim().length == 0) {
			alert("Please Enter a First name.");
			return;
		}
		if ($('#lastName').val().trim().length == 0) {
			alert("Please Enter a Last name.");
			return;
		}
		if ($('#username').val().trim().length == 0) {
			alert("Please Enter a User name.");
			return;
		}
		if ($('#password').val().trim().length == 0) {
			alert("Please Enter Password.");
			return;
		}
		if ($('#email').val().trim().length == 0) {
			alert("Please Enter Email.");
			return;
		}
		if ($('#dateOfBirth').val().trim().length == 0) {
			alert("Please Enter Date Of Birth.");
			return;
		}

		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
		var username = $('#username').val();
		var password = $('#password').val();
		var email = $('#email').val();
		var dateOfBirth = $('#dateOfBirth').val();
		var data = {
			firstName : firstName,
			lastName : lastName,
			username : username,
			password : password,
			email : email,
			dateOfBirth : dateOfBirth
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/saveUser",
			type : "POST",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(data),
			success : function(response) {
				if (response.status == true) {
					alert("User Details generated successfully.");
				} else if (response.status == false) {
					alert("Problem while generating User Details.");
				}
			}
		});

	});
</script>
</html>