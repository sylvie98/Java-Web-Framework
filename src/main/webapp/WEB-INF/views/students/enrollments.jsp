<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Enrollment for ${student.firstName} ${student.lastName}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>Enrollment History for ${student.firstName} ${student.lastName}</h2>
    
    <div class="card mb-4">
        <div class="card-header">Enroll into New Course</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/students/${student.id}/enroll" method="post" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Course</label>
                    <select name="courseId" class="form-select" required>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.id}">${course.courseCode} - ${course.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Semester</label>
                    <input type="text" name="semester" class="form-control" placeholder="e.g. 1" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Academic Year</label>
                    <input type="text" name="academicYear" class="form-control" placeholder="e.g. 2023/2024" required>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-success w-100">Enroll</button>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Semester</th>
                <th>Academic Year</th>
                <th>Enrollment Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="enrollment" items="${enrollments}">
                <tr>
                    <td>${enrollment.course.courseCode}</td>
                    <td>${enrollment.course.name}</td>
                    <td>${enrollment.semester}</td>
                    <td>${enrollment.academicYear}</td>
                    <td>${enrollment.enrollmentDate}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/students/${student.id}/drop/${enrollment.course.id}" 
                           class="btn btn-sm btn-danger" onclick="return confirm('Drop this course?')">Drop</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Back to Students</a>
</body>
</html>
