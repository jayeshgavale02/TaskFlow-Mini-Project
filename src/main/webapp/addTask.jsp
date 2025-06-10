<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Task</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
  />
  
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

    .text-small {
      font-size: 0.875rem;
    }
  </style>
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">TaskFlow</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="index.jsp">Home</a>
          </li>
           <li class="nav-item">
            <a class="nav-link " href="addTask.jsp">Add Task</a>
          </li>
          <li class="nav-item">
            <a class="btn btn-outline-danger ms-3" href="#">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container">
    <div class="row justify-content-center row-8">
      <div class="col-md-8">
        <div class="card p-4 mt-5">
          <h3 class="text-center mb-4">Add Task</h3>
          
          <form action="Login" method="post">
            <div class="mb-3">
              <label for="title" class="form-label">Title</label>
              <input type="text" class="form-control" name="title" placeholder="Enter your Title">
            </div>

            <div class="mb-3">
              <label for="description" class="form-label">Description</label>
              <input type="text" class="form-control" name="description" placeholder="Enter your description">
            </div>

            <div class="mb-3">
              <label for="due_date" class="form-label">Due Date</label>
              <input type="date" class="form-control" name="due_date" placeholder="Enter your Due Date">
            </div>

            <div class="d-grid mb-3">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>

       
          </form>
        </div>
      </div>
    </div>
  </div>


  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
  ></script>
</body>
</html>
