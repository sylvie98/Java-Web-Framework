<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Student Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Student Form</h2>
    <form:form action="${pageContext.request.contextPath}/students/save" modelAttribute="student" method="post">
        <form:hidden path="id"/>
        <div class="mb-3">
            <label class="form-label">First Name</label>
            <form:input path="firstName" class="form-control" required="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Last Name</label>
            <form:input path="lastName" class="form-control" required="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <form:input path="email" type="email" class="form-control" required="true"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Department</label>
            <form:select path="department.id" class="form-select">
                <c:forEach var="dept" items="${departments}">
                    <form:option value="${dept.id}" label="${dept.name}"/>
                </c:forEach>
            </form:select>
        </div>
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Cancel</a>
    </form:form>
</body>
</html>
