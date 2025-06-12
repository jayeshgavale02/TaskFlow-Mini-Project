<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Add Task</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
body {
	min-height: 100vh;
}

.card {
	border: none;
	box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
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
</style>
</head>
<body>
	<%
	HttpSession sessionObj = request.getSession(false);
	int userId = sessionObj != null && sessionObj.getAttribute("user_id") != null
			? Integer.parseInt(sessionObj.getAttribute("user_id").toString())
			: -1;

	ResultSet taskResultSet = null;
	Connection conn = null;
	PreparedStatement stmt = null;

	if (userId != -1) {
		try {
			conn = com.taskflow.DB.getConnection();
			String sql = "SELECT id, title, description, status, due_date FROM tasks WHERE user_id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userId);
			taskResultSet = stmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
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
					<li class="nav-item"><a class="nav-link" href="addTask.jsp">
							<i class="fas fa-plus me-1"></i>Add Task
					</a></li>
					<li class="nav-item"><a class="btn btn-outline-danger ms-3"
						href="Logout.jsp"> <i class="fas fa-sign-out-alt me-1"></i>Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card p-4 mt-5">
					<div
						class="d-flex justify-content-between align-items-center mb-3 position-relative">
						<h3 class="mx-auto">Add Task</h3>
						<button class="btn btn-outline-secondary position-absolute end-0"
							data-bs-toggle="modal" data-bs-target="#viewTasksModal">View
							Tasks</button>
					</div>

					<%
					String errorMessage = (String) request.getAttribute("errorMessage");
					%>
					<%
					String successMessage = (String) request.getAttribute("successMessage");
					%>

					<%
					if (errorMessage != null) {
					%>
					<div style="color: red; text-align: center;"><%=errorMessage%></div>
					<%
					} else if (successMessage != null) {
					%>
					<div style="color: green; text-align: center;"><%=successMessage%></div>
					<%
					}
					%>
					<%
					String success = (String) session.getAttribute("successMessage");
					String error = (String) session.getAttribute("errorMessage");

					if (success != null) {
					%>
					<div class="alert alert-success text-center"><%=success%></div>
					<%
					session.removeAttribute("successMessage");
					}

					if (error != null) {
					%>
					<div class="alert alert-danger text-center"><%=error%></div>
					<%
					session.removeAttribute("errorMessage");
					}
					%>

					<form action="addtask" method="post">
						<input type="hidden" name="user_id" value="<%=userId%>">
						<div class="mb-3">
							<label for="title" class="form-label">Title</label> <input
								type="text" class="form-control" name="title" required>
						</div>
						<div class="mb-3">
							<label for="description" class="form-label">Description</label> <input
								type="text" class="form-control" name="description" required>
						</div>
						<div class="mb-3">
							<label for="due_date" class="form-label">Due Date</label> <input
								type="date" class="form-control" name="due_date" required>
						</div>
						<div class="d-grid mb-3">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- View Tasks Modal -->
	<div class="modal fade" id="viewTasksModal" tabindex="-1"
		aria-labelledby="viewTasksModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="viewTasksModalLabel">Task List</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered table-hover text-center">
						<thead class="table-light">
							<tr>
								<th>Title</th>
								<th>Description</th>
								<th>Due Date</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (taskResultSet != null) {
								while (taskResultSet.next()) {
							%>
							<tr>
								<td><%=taskResultSet.getString("title")%></td>
								<td><%=taskResultSet.getString("description")%></td>
								<td><%=taskResultSet.getString("due_date")%></td>
								<td><%=taskResultSet.getString("status") != null ? taskResultSet.getString("status") : "pending"%></td>
								<td><a class="btn btn-sm btn-warning"
									href="TaskEdit.jsp?id=<%=taskResultSet.getString("id")%>">Edit</a>
									<a class="btn btn-sm btn-danger"
									href="DeleteTask?id=<%=taskResultSet.getString("id")%>"
									onclick="return confirm('Are you sure you want to delete this task?')">Delete</a>
								</td>
							</tr>
							<%
							}
							}
							if (stmt != null)
							stmt.close();
							if (conn != null)
							conn.close();
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
