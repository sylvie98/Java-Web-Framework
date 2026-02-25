<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Enrollment Service - Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h1>Welcome to Enrollment Service</h1>
    <hr>
    <div class="list-group col-md-6">
        <a href="${pageContext.request.contextPath}/students" class="list-group-item list-group-item-action">Manage Students</a>
        <a href="${pageContext.request.contextPath}/lecturers" class="list-group-item list-group-item-action">Manage Lecturers</a>
        <a href="${pageContext.request.contextPath}/courses" class="list-group-item list-group-item-action">Manage Courses</a>
        <a href="${pageContext.request.contextPath}/departments" class="list-group-item list-group-item-action">Manage Departments</a>
    </div>
</body>
</html>
