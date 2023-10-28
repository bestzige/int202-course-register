package dev.bestzige.int202courseregister.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CourseRegistered {
    private Map<Integer, List<Subject>> registeredSubjects = new HashMap<>();

    public void registerSubject(int semester, Subject subject) {
        if (registeredSubjects.get(semester) == null) {
            registeredSubjects.put(semester, new ArrayList<>());
        }
        registeredSubjects.get(semester).add(subject);
    }
    public void removeAllRegisteredCourse(int semester) {
        registeredSubjects.remove(semester);
    }

    public void removeAllRegisteredCourse() {
        registeredSubjects.clear();
    }

    public List<Subject> getRegisteredCourse(int semester) {
        return registeredSubjects.get(semester);
    }

    public Map<Integer, List<Subject>> getHistory() {
        return registeredSubjects;
    }

    public List<Subject> getRegisteredSubjects(int semester) {
        return registeredSubjects.get(semester);
    }
}
