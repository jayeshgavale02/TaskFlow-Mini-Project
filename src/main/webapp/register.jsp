<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(to right, #6a11cb, #2575fc);
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
}

.form-control:focus {
	box-shadow: none;
	border-color: #6a11cb;
}

.btn-primary {
	background-color: #6a11cb;
	border: none;
}

.btn-primary:hover {
	background-color: #5b0eb5;
}

.text-small {
	font-size: 0.875rem;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="card p-4">
					<h3 class="text-center mb-4">Register</h3>

					<%
					String errorMessage = (String) request.getAttribute("errorMessage");
					%>
					<%
					if (errorMessage != null) {
					%>
					<div style="color: red; text-align: center;"><%=errorMessage%></div>
					<%
					}
					%>

					<form action="Register" method="post">
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" name="username"
								placeholder="Enter username">
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" name="password"
								placeholder="Enter password">
						</div>

						<div class="d-grid mb-3">
							<button type="submit" class="btn btn-primary">Register</button>
						</div>

						<p class="text-center text-small mb-0">
							Already have an account? <a href="login.jsp"
								class="text-decoration-none">Login</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
