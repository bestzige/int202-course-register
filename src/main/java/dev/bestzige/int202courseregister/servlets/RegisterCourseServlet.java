package dev.bestzige.int202courseregister.servlets;

import dev.bestzige.int202courseregister.models.CourseRegistered;
import dev.bestzige.int202courseregister.models.CourseRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "RegisterCourseServlet", value = "/register-course")
public class RegisterCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        int semester = Integer.valueOf(parameterMap.get("semester")[0]);
        HttpSession session = req.getSession();
        CourseRegistered courseRegistered = (CourseRegistered) session.getAttribute("courseRegistered");
        if(courseRegistered == null) {
            courseRegistered = new CourseRegistered();
            session.setAttribute("courseRegistered", courseRegistered);
        } else {
            courseRegistered.removeAllRegisteredCourse(semester);
        }

        for (String subjectId : parameterMap.get("registeredSubjects")) {
            courseRegistered.registerSubject(semester, CourseRepository.getSubject(semester, subjectId));
        }

        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
