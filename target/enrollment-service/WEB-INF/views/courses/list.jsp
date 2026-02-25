<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Course List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Course Management</h2>
    <a href="${pageContext.request.contextPath}/courses/new" class="btn btn-primary mb-3">Add New Course</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Lecturer</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="course" items="${courses}">
                <tr>
                    <td>${course.courseCode}</td>
                    <td>${course.name}</td>
                    <td>${course.lecturer.firstName} ${course.lecturer.lastName}</td>
                    <td>${course.department.name}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/courses/edit/${course.id}" class="btn btn-sm btn-warning">Edit</a>
                        <a href="${pageContext.request.contextPath}/courses/delete/${course.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
