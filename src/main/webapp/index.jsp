<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TaskFlow - Home</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

	<%
	HttpSession sessionObj = request.getSession(false);
	boolean isLoggedIn = (sessionObj != null && sessionObj.getAttribute("user_id") != null);
	%>

	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold" href="index.jsp"> <i
				class="fas fa-tasks me-2"></i>TaskFlow
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						href="index.jsp"> <i class="fas fa-home me-1"></i>Home
					</a></li>

					<%
					if (isLoggedIn) {
					%>
					<li class="nav-item"><a class="nav-link" href="addTask.jsp">
							<i class="fas fa-plus me-1"></i>Add Task
					</a></li>
					<li class="nav-item"><a class="btn btn-outline-danger ms-3"
						href="Logout.jsp"> <i class="fas fa-sign-out-alt me-1"></i>Logout
					</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="btn btn-outline-primary ms-3"
						href="login.jsp"> <i class="fas fa-sign-in-alt me-1"></i>Login
					</a></li>
					<%
					}
					%>

				</ul>
			</div>
		</div>
	</nav>


	<div class="container py-5">
		<div class="row align-items-center">
			<div class="col-lg-6">
				<h1>
					Welcome to <strong>TaskFlow</strong>
				</h1>
				<h4>Your efficient, secure, and user-friendly task management
					system.</h4>
				<a href="login.jsp" class="btn btn-primary mt-3"> <i
					class="fas fa-rocket me-2"></i> Get Started
				</a>
			</div>
			<div class="col-lg-6 text-center">
				<img src="https://icon-library.com/images/task-management-icon/task-management-icon-20.jpg" alt="Task Management Illustration"
					class="" style="    height: 363px;" />
			</div>
		</div>
	</div>

	<div class="container my-5">
		<h3 class="text-center mb-4">
			<i class="fas fa-star me-2"></i>Key Features
		</h3>
		<div class="row g-4">
			<div class="col-md-6">
				<div class="card p-4 text-center">
					<h5>
						<i class="fas fa-user-shield me-2"></i>User Authentication
					</h5>
					<p>Secure login and session handling for each user.</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card p-4 text-center">
					<h5>
						<i class="fas fa-plus-circle me-2"></i>Add & View Tasks
					</h5>
					<p>Create and manage your tasks with due dates and statuses.</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card p-4 text-center">
					<h5>
						<i class="fas fa-filter me-2"></i>Task Filtering
					</h5>
					<p>Filter tasks by status: All, Pending, or Completed.</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card p-4 text-center">
					<h5>
						<i class="fas fa-edit me-2"></i>Edit & Delete
					</h5>
					<p>Easily update or remove tasks as needed.</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container my-5">
		<h3 class="text-center mb-4">
			<i class="fas fa-shield-alt me-2"></i>Security with TaskFlow
		</h3>
		<div class="accordion accordion-flush" id="accordionExample">
			<!-- Item 1 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne">
						How We Secure Your Tasks</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse"
					data-bs-parent="#accordionExample">
					<div class="accordion-body">We use secure authentication
						methods and restrict task visibility to only the logged-in user
						via sessions.</div>
				</div>
			</div>
			<!-- Item 2 -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo">
						Why Choose TaskFlow?</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					data-bs-parent="#accordionExample">
					<div class="accordion-body">TaskFlow is simple, fast, and
						built with core Java EE technologies. It supports essential
						features without unnecessary complexity.</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="bg-light py-3 text-center">
		<div class="container">
			<span class="text-muted">All rights reserved 2025 TaskFlow.</span>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
