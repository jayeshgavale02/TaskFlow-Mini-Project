<%@page import="com.taskflow.DB"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String title = "";
    String description = "";
    String due_date = "";

    try {
    	
        Connection conn = DB.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tasks WHERE id = ?");
        stmt.setInt(1, Integer.parseInt(id));
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            title = rs.getString("title");
            description = rs.getString("description");
            due_date = rs.getString("due_date");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Update Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

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

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">TaskFlow</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="addTask.jsp">Add Task</a></li>
                <li class="nav-item"><a class="btn btn-outline-danger ms-3" href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center row-8">
        <div class="col-md-8">
            <div class="card p-4 mt-5">
                <div class="d-flex justify-content-between align-items-center mb-3 position-relative">
                    <h3 class="mx-auto">Update Task</h3>
                </div>

                <form action="taskedit" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" name="title" value="<%= title %>" required>
                        <input type="hidden" name="id" value="<%= id %>">
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" name="description" value="<%= description %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="due_date" class="form-label">Due Date</label>
                        <input type="date" class="form-control" name="due_date" value="<%= due_date %>" required>
                    </div>

                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-success">Update Task</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
