package hospital.servlet;

import hospital.dao.impl.DepartmentDaoimpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DepartmentRemoveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String A_Name = request.getParameter("A_Name");
            int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
            int departmentId = Integer.parseInt(request.getParameter("departmentId"));
            DepartmentDaoimpl departmentdaoimpl = new DepartmentDaoimpl();
            departmentdaoimpl.delete(departmentId);
            //System.out.println(departmentId);
            response.sendRedirect("./AdminDepartment.jsp?hospitalId=" + hospitalId + "&A_Name=" + A_Name);
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
