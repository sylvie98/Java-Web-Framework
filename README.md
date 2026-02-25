# Enrollment Service - Spring MVC Project

A comprehensive Student Enrollment Management System built using Spring MVC, Spring Data JPA, and PostgreSQL.

## Features

- **Student Management**: Full CRUD operations and enrollment history.
- **Lecturer Management**: Manage lecturers and assign them to departments.
- **Course Management**: Manage courses, associated with lecturers and departments.
- **Department Management**: Organize courses and lecturers by department.
- **Enrollment System**:
    - Enroll students into courses for specific semesters/academic years.
    - Drop courses.
    - View student enrollment history.
- **Validation**: Dummy communication layer to validate student and course status during enrollment.
- **UI**: Modern responsive interface using JSP and Bootstrap 5.

## Technologies Used

- **Java 17**
- **Spring Framework 6.1.15** (Spring MVC, Spring ORM)
- **Spring Data JPA 3.2.5**
- **Hibernate 6.4.4.Final**
- **PostgreSQL 42.6.0**
- **Jakarta Servlet 6.0**
- **Jakarta JSTL 3.0**
- **Maven** (Build Tool)
- **Bootstrap 5** (Styling)

## Prerequisites

Before running the project, ensure you have the following installed:
- **JDK 17** or higher
- **Maven 3.6+**
- **PostgreSQL 12+**
- A Servlet Container like **Apache Tomcat 10+** (Required for Jakarta EE support)

*Note: If you are using Tomcat 9 or older, you must use Spring 5.3.x and the `javax.servlet` namespace. This project has been upgraded to Spring 6 for Tomcat 10+ compatibility.*

## Database Setup

1. Open your PostgreSQL terminal or tool (e.g., pgAdmin).
2. Create a database named `enrollment_db`:
   ```sql
   CREATE DATABASE enrollment_db;
   ```
3. Update the database credentials in `src/main/java/com/groupe/config/AppConfig.java` if necessary:
   ```java
   @Bean
   public DataSource dataSource() {
       DriverManagerDataSource dataSource = new DriverManagerDataSource();
       dataSource.setDriverClassName("org.postgresql.Driver");
       dataSource.setUrl("jdbc:postgresql://localhost:5432/enrollment_db");
       dataSource.setUsername("postgres"); // your username
       dataSource.setPassword("password"); // your password
       return dataSource;
   }
   ```
   *Note: Hibernate is configured to automatically create/update tables (`hibernate.hbm2ddl.auto=update`).*

## How to Run

### Using Maven (Command Line)

1. Clone or download the project.
2. Navigate to the project root directory.
3. Build the project:
   ```bash
   mvn clean package
   ```
4. This will generate a `enrollment-service.war` file in the `target/` directory.

### Deploying to Tomcat

1. Copy the `enrollment-service.war` from the `target` folder to your Tomcat's `webapps` directory.
2. Start Tomcat.
3. Access the application at `http://localhost:8085/enrollment-service/` (assuming your Tomcat port is 8085).

### Using IDE (IntelliJ IDEA / Eclipse)

1. Import the project as a Maven project.
2. Configure a Tomcat Server in your IDE.
3. Add the `enrollment-service:war exploded` artifact to the server.
4. Run/Debug the server.

## Architecture & How it Works

The project follows the standard **Model-View-Controller (MVC)** architectural pattern:

### 1. Model Layer (`com.groupe.model`)
Contains JPA Entities (`Student`, `Course`, `Lecturer`, `Department`, `Enrollment`) that map to database tables. Relationships (One-to-Many, Many-to-One) are handled via Hibernate annotations.

### 2. DAO/Repository Layer (`com.groupe.dao`)
Uses **Spring Data JPA** interfaces to perform CRUD operations. This abstracts the boilerplate JDBC/JPA code.

### 3. Service Layer (`com.groupe.service`)
`SchoolService` contains the business logic. It coordinates between different repositories and performs complex operations like `enrollStudent`, which includes dummy validation logic.

### 4. Controller Layer (`com.groupe.controller`)
Handles HTTP requests, interacts with the Service layer, and returns the appropriate JSP view name along with data models.

### 5. View Layer (`src/main/webapp/WEB-INF/views`)
JSP pages styled with Bootstrap 5. It uses JSTL tags for logic and data iteration.

## Project Structure

```

---

## Recent Improvements & Missing Files Added

- Service classes for each entity (CourseService, DepartmentService, LecturerService, StudentService, EnrollmentService)
- Global exception handler (exception/GlobalExceptionHandler.java)
- Static resources folder structure (resources/css, resources/js, resources/images)

## API Endpoints
- `/courses` - Manage courses
- `/departments` - Manage departments
- `/lecturers` - Manage lecturers
- `/students` - Manage students
- `/enrollments` - Manage enrollments

## To Do
- Add DTOs for each entity
- Add more unit tests
- Add utility/helper classes as needed

---
For more details, see the source code and comments in each package.
enrollment-service/
├── src/
│   ├── main/
│   │   ├── java/com/groupe/
│   │   │   ├── config/        # Spring & Web Configuration
│   │   │   ├── controller/    # Web Controllers
│   │   │   ├── dao/           # Spring Data JPA Repositories
│   │   │   ├── model/         # JPA Entities
│   │   │   └── service/       # Business Logic
│   │   ├── webapp/
│   │   │   ├── WEB-INF/views/ # JSP Templates
│   │   │   └── resources/     # Static assets (CSS/JS)
│   └── test/                  # Unit tests
├── pom.xml                    # Maven Dependencies
└── README.md
```
