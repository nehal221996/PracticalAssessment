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


<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<body class="page-header-fixed">
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- BEGIN PAGE HEADER-->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title" id="title"></h3>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12" style="padding-top: 10px;">
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption">
									<div class="form-group" style="float: right;">
										<a href="${pageContext.request.contextPath}/userRegistration">Add
											User</a>
									</div>
								</div>
							</div>
							<div class="portlet-body">
								<table id="example"
									class="display table table-striped table-bordered table-hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Name</th>
											<th>Date of Birth</th>
											<th>User name</th>
											<th>Email</th>
											<th>Action</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END CONTENT -->
	</div>

	<!-- END CONTAINER -->
	
	<script
		src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(function() {
			setTable();

		});

		function editUser(id) {
			$
					.ajax({
						url : '${pageContext.request.contextPath}/viewUserById/'
								+ id,
						type : 'GET',
						success : function(response) {
							console.log(response.data)
							window.location = "${pageContext.request.contextPath}/userRegistration";
						},
						// callback handler that will be called on error
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});

		}

		function removeUser(id) {
			$.ajax({
				url : '${pageContext.request.contextPath}/deleteUser/' + id,
				type : 'GET',
				success : function(response) {
					if (response != null) {
						alert("User is deleted successfully.");
						setTable();
					}
				},
				// callback handler that will be called on error
				error : function(jqXHR, textStatus, errorThrown) {
					setTable();
				}
			});
		}

		function setTable() {
			$('#example')
					.dataTable(
							{
								"destroy" : true,
								"serverSide" : false,
								"bDestroy" : true,
								"ajax" : {
									url : "${pageContext.request.contextPath}/viewList"
								},
								"order" : [ [ 0, "desc" ] ],
								"columns" : [
										{
											"data" : null,
											"render" : function(data, type, row) {
												var data = "";
												data = row.firstName + " "
														+ row.lastName;
												return data;
											},
										},
										{
											"data" : "dateOfBirth"
										},
										{
											"data" : "username"
										},
										{
											"data" : "email"
										},
										{
											"data" : null,
											"render" : function(data, type, row) {
												var data = "";
												data = "&nbsp;<button type='button' onclick='editUser(\""
														+ row.id
														+ "\");' class='btn btn-warning btn-xs'>Edit</button>&nbsp;<button type='button' onclick='removeUser("
														+ row.id
														+ ");' class='btn btn-warning btn-xs'>Delete</button>";
												return data;
											},
										}

								],
								"paging" : true,
								"pageLength" : 10,
								"ordering" : true,
								"order" : [ 0, "asc" ]
							});
		}
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>