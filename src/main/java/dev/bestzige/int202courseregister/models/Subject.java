package dev.bestzige.int202courseregister.models;

import java.util.List;
import java.util.Map;

public class Subject {
    private final String subjectId;
    private final String title;
    private final Double credit;
    private Double grade = null;

    private final static Map<Double, String> GRADE;
    private final static Map<String, Double> GRADE_STR;

    static {
        GRADE = Map.of(
                0.0, "F",
                1.0, "D",
                1.5, "D+",
                2.0, "C",
                2.5, "C+",
                3.0, "B",
                3.5, "B+",
                4.0, "A"
        );
        GRADE_STR = Map.of(
                "F", 0.0,
                "D", 1.0,
                "D+", 1.5,
                "C", 2.0,
                "C+", 2.5,
                "B", 3.0,
                "B+", 3.5,
                "A", 4.0
        );
    }

    public Subject(String id, String title, double credit) {
        this.subjectId = id;
        this.title = title;
        this.credit = credit;
    }

    public List<Double> getAllGrade() {
        return List.copyOf(GRADE.keySet());
    }

    public List<String> getAllGradeText() {
        return List.copyOf(GRADE.values());
    }

    public String getGradeText() {
        return GRADE.get(grade);
    }

    public Double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        if(!GRADE.containsKey(grade)) throw new IllegalArgumentException("Invalid grade");
        this.grade = grade;
    }

    public void setGrade(String grade) {
        if(!GRADE_STR.containsKey(grade)) throw new IllegalArgumentException("Invalid grade");
        this.grade = GRADE_STR.get(grade);
    }

    public String getSubjectId() {
        return subjectId;
    }

    public String getTitle() {
        return title;
    }

    public double getCredit() {
        return credit;
    }

    @Override
    public String toString() {
        return String.format("%s %s %.1f %s", subjectId, title, credit, getGradeText());
    }
}
