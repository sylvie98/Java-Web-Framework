<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Lecturer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Lecturer Management</h2>
    <a href="${pageContext.request.contextPath}/lecturers/new" class="btn btn-primary mb-3">Add New Lecturer</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lecturer" items="${lecturers}">
                <tr>
                    <td>${lecturer.id}</td>
                    <td>${lecturer.firstName}</td>
                    <td>${lecturer.lastName}</td>
                    <td>${lecturer.department.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/lecturers/edit/${lecturer.id}" class="btn btn-sm btn-warning">Edit</a>
                        <a href="${pageContext.request.contextPath}/lecturers/delete/${lecturer.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
