package dev.bestzige.int202courseregister.models;

import java.util.*;

public class CourseRepository {
    private final static String DATA_FILE = "data.txt";

    private static final Map<Integer, List<Subject>> courses = new HashMap();

    private static void init() {
        Scanner sc;
        sc = new Scanner(CourseRepository.class.getClassLoader().getResourceAsStream(DATA_FILE), "utf-8");
        String dataLine[];
        while (sc.hasNextLine()) {
            dataLine = sc.nextLine().split(",");
            int semester = Integer.valueOf(dataLine[0]);
            Subject subject = new Subject(dataLine[1], dataLine[2], Double.valueOf(dataLine[3]));
            if (courses.get(semester) == null) {
                courses.put(semester, new ArrayList());
            }
            courses.get(semester).add(subject);
        }
        sc.close();
    }

    static {
        init();
    }

    public static List<Subject> getSubjects(int semester) {
        return courses.get(semester);
    }

    public static Subject getSubject(int semester, String subjectId) {
        for (Subject subject : courses.get(semester)) {
            if (subject.getSubjectId().equalsIgnoreCase(subjectId)) {
                return subject;
            }
        }
        return null;
    }
}
