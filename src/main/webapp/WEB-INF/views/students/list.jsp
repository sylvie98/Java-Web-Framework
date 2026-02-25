<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Student List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Student Management</h2>
    <a href="${pageContext.request.contextPath}/students/new" class="btn btn-primary mb-3">Add New Student</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.firstName}</td>
                    <td>${student.lastName}</td>
                    <td>${student.email}</td>
                    <td>${student.department.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/students/edit/${student.id}" class="btn btn-sm btn-warning">Edit</a>
                        <a href="${pageContext.request.contextPath}/students/delete/${student.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        <a href="${pageContext.request.contextPath}/students/${student.id}/enrollments" class="btn btn-sm btn-info">Enrollment</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
