package controllers;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.ProfileBean;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection con = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/student_profile",
                "app", "app"
            );

            String sql = "INSERT INTO profile "
                       + "(name, student_id, program, email, hobbies, intro) "
                       + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, studentId);
            ps.setString(3, program);
            ps.setString(4, email);
            ps.setString(5, hobbies);
            ps.setString(6, intro);

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();   // IMPORTANT for debugging
            throw new ServletException(e);
        }

        request.setAttribute("profile", profile);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
