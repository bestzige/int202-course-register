package dev.bestzige.int202courseregister.models;

public class Semester {
    private static final String[] TITLE = {
            null,
            "Semester 1/ Academic Year 1",
            "Semester 2/ Academic Year 1",
            "Semester 1/ Academic Year 2",
            "Semester 2/ Academic Year 2",
            "Semester 1/ Academic Year 3",
            "Semester 2/ Academic Year 3",
            "Semester 1/ Academic Year 4",
            "Semester 2/ Academic Year 4",
            "Special Semester for WIL Program"
    };

    public static String[] getAllSemesterText() {
        return TITLE;
    }

    public static String getSemesterText(int semesterNumber) {
        if(semesterNumber>=TITLE.length) {
            return null;
        }
        return TITLE[semesterNumber];
    }
}
