<%
    int UserID = Integer.parseInt(request.getParameter("UserID"));
    int HospitalID = Integer.parseInt(request.getParameter("HospitalID"));
%><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.service.PatientService" %>
<%@ page import="hospital.user.Patient" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.dao.impl.HospitalDaoImpl" %>
<%@ page import="hospital.user.Hospital" %>
<%@ page import="hospital.dao.impl.DepartmentDaoimpl" %>
<%@ page import="hospital.user.Department" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
    <link rel="stylesheet" href="css/navbar.css">
</head>
<body>
<h1>桂林市医院统一预约挂号服务平台</h1>
<div>
    <!-- 导航栏 -->
    <ul class="navbar">
        <li><a href="./PatientCenter.jsp?UserID=<%= UserID %>">首页</a></li>
        <li><a href="./PatientShow.jsp?UserID=<%= UserID %>">个人信息</a></li>
        <li><a href="./PatientSelectHospital.jsp?UserID=<%= UserID %>">预约挂号</a></li>
        <li><a href="./PatientSickShow.jsp?UserID=<%= UserID %>">查看挂号信息</a></li>
    </ul>
</div>

<div>
    <h1>找科室</h1>
    <%
        DepartmentDaoimpl departmentdaoimpl = new DepartmentDaoimpl();
        List<Department> departmentList = null;
        try {
            departmentList = departmentdaoimpl.findAll(HospitalID); // 调用 findAll() 函数获取全部用户信息
        } catch (Exception e) {
            e.printStackTrace();
        }
        assert departmentList != null;
    %>
    <div>
        <table>
            <thead>
            <tr>
                <th>科室编号</th>
                <th>科室名</th>
                <th>科长</th>
                <th>介绍</th>
                <th>营业时间</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%for (Department department : departmentList) { %>
            <tr>
                <td><%= department.getDepartmentid() %></td>
                <td><%= department.getDepartmentname() %></td>
                <td><%= department.getDepartmenthead() %></td>
                <td><%= department.getIntroduction() %></td>
                <td><%= department.getClinichours() %></td>
                <td>
                    <label>
                        <input type="hidden" name="Id" value="<%=department.getId()%>">
                    </label>
                    <button class="button" type="submit" onclick="SelectDoctor(<%=UserID%>,<%=HospitalID%>,<%=department.getDepartmentid()%>); return false;">选择该科室</button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function SelectDoctor(UserID, HospitalID, DepartmentID) {
        // 在这里进行页面跳转
        window.location.href = "./PatientSelectDoctor.jsp?UserID=" + UserID + "&HospitalID=" + HospitalID + "&DepartmentID=" + DepartmentID;
    }
</script>

</body>
</html>