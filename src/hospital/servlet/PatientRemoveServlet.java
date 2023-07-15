package hospital.servlet;

import hospital.dao.impl.PatientDaoImpl;
import hospital.dao.impl.SickDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PatientRemoveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String A_Name = request.getParameter("A_Name");
            int Id = Integer.parseInt(request.getParameter("Id"));
            SickDaoImpl sickDaoimpl = new SickDaoImpl();
            sickDaoimpl.deletebyUserID(Id);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }


        try {
            String A_Name = request.getParameter("A_Name");
            int Id = Integer.parseInt(request.getParameter("Id"));
            PatientDaoImpl patientdaoimpl = new PatientDaoImpl();
            System.out.println(Id);
            patientdaoimpl.delete(Id);
            response.sendRedirect("./AdminUsers.jsp?A_Name=" + A_Name);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
