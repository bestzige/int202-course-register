package dev.bestzige.int202courseregister.servlets;

import dev.bestzige.int202courseregister.models.CourseRegistered;
import dev.bestzige.int202courseregister.models.CourseRepository;
import dev.bestzige.int202courseregister.models.Semester;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CourseListServlet", value = "/course-list")
public class CourseListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext sc = getServletContext();
        if(sc.getAttribute("semesters") == null) {
            sc.setAttribute("semesters", Semester.getAllSemesterText());
        }
        getServletContext().getRequestDispatcher("/course-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        req.setCharacterEncoding("UTF-8");
        if(parameterMap.get("semester") == null) {
            doGet(req, resp);
            return;
        }
        int semester = Integer.valueOf(parameterMap.get("semester")[0]);
        req.setAttribute("selectedSemester", semester);
        req.setAttribute("subjects", CourseRepository.getSubjects(semester));
        HttpSession session = req.getSession();
        if(session.getAttribute("courseRegistered") != null) {
            req.setAttribute("registeredSubjects", ((CourseRegistered) session.getAttribute("courseRegistered")).getRegisteredSubjects(semester));
        }
        getServletContext().getRequestDispatcher("/course-list.jsp").forward(req, resp);
    }
}
