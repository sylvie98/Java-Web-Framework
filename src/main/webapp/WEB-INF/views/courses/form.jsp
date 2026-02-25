<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Form</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
    <h2>${course != null ? 'Edit Course' : 'Add Course'}</h2>
    <form action="${course != null ? '/courses/update' : '/courses/create'}" method="post">
        <input type="hidden" name="id" value="${course.id}" />
        <label for="name">Course Name:</label>
        <input type="text" id="name" name="name" value="${course.name}" required /><br/>

        <label for="courseCode">Course Code:</label>
        <input type="text" id="courseCode" name="courseCode" value="${course.courseCode}" required /><br/>

        <label for="department">Department:</label>
        <select id="department" name="departmentId">
            <c:forEach var="dept" items="${departments}">
                <option value="${dept.id}" <c:if test="${course.department != null && course.department.id == dept.id}">selected</c:if>>${dept.name}</option>
            </c:forEach>
        </select><br/>

        <label for="lecturer">Lecturer:</label>
        <select id="lecturer" name="lecturerId">
            <c:forEach var="lect" items="${lecturers}">
                <option value="${lect.id}" <c:if test="${course.lecturer != null && course.lecturer.id == lect.id}">selected</c:if>>${lect.firstName} ${lect.lastName}</option>
            </c:forEach>
        </select><br/>

        <button type="submit">Submit</button>
    </form>
    <a href="/courses">Back to Course List</a>
</body>
</html>
