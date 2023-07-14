package hospital.servlet;

import hospital.dao.impl.DepartmentDaoimpl;
import hospital.dao.impl.HospitalDaoImpl;
import hospital.service.DoctorService;
import hospital.user.Doctor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * @author Administrator
 * 医生注册响应
 */
public class DoctorRegisterServlet extends HttpServlet {
    DoctorService doctorService=new DoctorService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HospitalDaoImpl hospitalDao = new HospitalDaoImpl();
        DepartmentDaoimpl departmentDaoimpl = new DepartmentDaoimpl();

        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String r_password=req.getParameter("r_password");
        String sex=req.getParameter("sex");
        int age= Integer.parseInt(req.getParameter("age"));
        String phone=req.getParameter("phone");

        String part=req.getParameter("part1");
        int HospitalId = Integer.parseInt(part);

        String part2=req.getParameter("part2");
        int DepartmentId = Integer.parseInt(part2);
        String part3=req.getParameter("part3");
        String discript=req.getParameter("discript");
        if (password == null || name == null || sex == null || phone == null || part == null || part2 == null || part3 == null || discript == null){
            req.setAttribute("Errormessage","请将所有信息填写完整!");
            req.getRequestDispatcher("DoctorRegister.jsp").forward(req,resp);
        }
        if (!Objects.equals(password, r_password)){
            req.setAttribute("Errormessage","密码不一致，请重新输入");
            req.getRequestDispatcher("DoctorRegister.jsp").forward(req,resp);
        }
        Doctor doctor=doctorService.DoctorRegister(name,HospitalId,DepartmentId,password,sex,age,phone,hospitalDao.find(HospitalId).getName(), departmentDaoimpl.findone(DepartmentId).getDepartmentname(),part3,discript);

        int id=doctor.getId();
        if(id!=0){
            resp.getWriter().write("注册成功!");
            /*转发到医生个人主页*/
            req.setAttribute("id",id);
            req.getRequestDispatcher("DoctorShow.jsp").forward(req,resp);
        }
        else{
            resp.getWriter().write("注册失败!");
            resp.sendRedirect("Error.jsp");
        }
    }
}
