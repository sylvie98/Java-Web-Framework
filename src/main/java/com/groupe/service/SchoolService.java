package com.groupe.service;

import com.groupe.dao.*;
import com.groupe.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SchoolService {

    @Autowired private StudentRepository studentRepository;
    @Autowired private LecturerRepository lecturerRepository;
    @Autowired private CourseRepository courseRepository;
    @Autowired private DepartmentRepository departmentRepository;
    @Autowired private EnrollmentRepository enrollmentRepository;

    // Student CRUD
    public List<Student> getAllStudents() { return studentRepository.findAll(); }
    public Student getStudentById(Long id) { return studentRepository.findById(id).orElse(null); }
    public void saveStudent(Student student) { studentRepository.save(student); }
    public void deleteStudent(Long id) { studentRepository.deleteById(id); }

    // Lecturer CRUD
    public List<Lecturer> getAllLecturers() { return lecturerRepository.findAll(); }
    public Lecturer getLecturerById(Long id) { return lecturerRepository.findById(id).orElse(null); }
    public void saveLecturer(Lecturer lecturer) { lecturerRepository.save(lecturer); }
    public void deleteLecturer(Long id) { lecturerRepository.deleteById(id); }

    // Course CRUD
    public List<Course> getAllCourses() { return courseRepository.findAll(); }
    public Course getCourseById(Long id) { return courseRepository.findById(id).orElse(null); }
    public void saveCourse(Course course) { courseRepository.save(course); }
    public void deleteCourse(Long id) { courseRepository.deleteById(id); }

    // Department CRUD
    public List<Department> getAllDepartments() { return departmentRepository.findAll(); }
    public Department getDepartmentById(Long id) { return departmentRepository.findById(id).orElse(null); }
    public void saveDepartment(Department department) { departmentRepository.save(department); }
    public void deleteDepartment(Long id) { departmentRepository.deleteById(id); }

    // Enrollment Logic
    @Transactional
    public String enrollStudent(Long studentId, Long courseId, String semester, String academicYear) {
        Student student = studentRepository.findById(studentId).orElse(null);
        Course course = courseRepository.findById(courseId).orElse(null);

        // Dummy validation
        if (student == null) return "Invalid Student";
        if (course == null) return "Invalid Course";
        
        System.out.println("[DUMMY] Validating student " + student.getEmail() + " and course " + course.getCourseCode());

        Enrollment enrollment = new Enrollment();
        enrollment.setStudent(student);
        enrollment.setCourse(course);
        enrollment.setSemester(semester);
        enrollment.setAcademicYear(academicYear);

        enrollmentRepository.save(enrollment);
        return "Success";
    }

    @Transactional
    public void dropCourse(Long studentId, Long courseId) {
        enrollmentRepository.deleteByStudentIdAndCourseId(studentId, courseId);
    }

    public List<Enrollment> getStudentEnrollmentHistory(Long studentId) {
        Student student = studentRepository.findById(studentId).orElse(null);
        if (student != null) {
            return enrollmentRepository.findByStudent(student);
        }
        return null;
    }
}
