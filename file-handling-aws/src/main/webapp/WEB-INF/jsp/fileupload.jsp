<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">Upload a File</h2>
    <form method="post" action="upload" enctype="multipart/form-data" class="mb-4">
        <div class="form-group">
            <input type="file" name="file" class="form-control-file" required />
        </div>

        <button type="submit" class="btn btn-primary">Upload</button>
    </form>

    <h2 class="mb-4">Files in S3 Bucket</h2>
    <ul class="list-group">
        <c:forEach var="file" items="${files}">
            <li class="list-group-item">
                <a href="download/${file}" class="btn btn-link">${file}</a> |
                <a href="delete/${file}" class="btn btn-danger btn-sm">Delete</a>
            </li>
        </c:forEach>
    </ul>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
