package service;

import model.Student;

import java.util.ArrayList;

public class StudentService {
    private static final ArrayList<Student> studentList;

    static {
        studentList = new ArrayList<>();
        studentList.add(new Student(1, "Mike", 27, "HN", 8.5));
        studentList.add(new Student(2, "Tom", 18, "HCM", 9));
        studentList.add(new Student(3, "Halley", 22, "BN", 7.5));
    }

    public Student getStudent(int id) {
        for (Student student : studentList) {
            if (student.getId() == id) {
                return student;
            }
        }
        return null;
    }

    public void addStudent(Student student) {
        studentList.add(student);
    }

    public void deleteStudent(Student student) {
        studentList.remove(student);
    }

    public void editStudent(int index, Student student) {
        studentList.set(index, student);
    }

    public ArrayList<Student> displayAll() {
        return studentList;
    }

    public ArrayList<Student> sortStudent() {
        studentList.sort((o1, o2) -> (int) (o1.getAvgPoint() - o2.getAvgPoint()));
        return studentList;
    }

    public ArrayList<Student> getStudentListByAvg() {
        ArrayList<Student> students = new ArrayList<>();
        for (Student student : studentList) {
            if (student.getAvgPoint() >= 8) {
                students.add(student);
            }
        }
        return students;
    }

    public ArrayList<Student> searchStudentByName(String name) {
        ArrayList<Student> students = new ArrayList<>();
        for (Student student : studentList) {
            if (student.getName().equals(name)) {
                students.add(student);
            }
        }
        return students;
    }
}
