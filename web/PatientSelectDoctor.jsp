<%
    int UserID = Integer.parseInt(request.getParameter("UserID"));
    int HospitalID = Integer.parseInt(request.getParameter("HospitalID"));
    int DepartmentID = Integer.parseInt(request.getParameter("DepartmentID"));
%><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="hospital.dao.impl.DoctorDaoImpl" %>
<%@ page import="hospital.user.Doctor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/fanhui.css">
</head>
<body>
<h1>桂林市医院统一预约挂号服务平台</h1>

<div id="patternContainer">
    <a href="./PatientSelectHospital.jsp?UserID=<%= UserID %>" target="_self">
        <canvas id="patternCanvas" width="80" height="80"></canvas>
    </a>
</div>

<script>
    // 获取画布元素和上下文
    const canvas = document.getElementById('patternCanvas');
    const ctx = canvas.getContext('2d');

    // 清空画布
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // 绘制箭头路径
    ctx.beginPath();
    ctx.moveTo(canvas.width / 2 - 15, canvas.height / 2);
    ctx.lineTo(canvas.width / 2 + 15, canvas.height / 2 - 15);
    ctx.lineTo(canvas.width / 2 + 15, canvas.height / 2 + 15);
    ctx.closePath();
    ctx.fillStyle = 'lightblue'; // 可以更改颜色
    ctx.fill();

    // 添加点击事件监听器
    canvas.addEventListener('click', function() {
        window.open('#', '_self');
    });
</script>


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
    <h1>找医生</h1>
    <%
        DoctorDaoImpl doctordaoimpl = new DoctorDaoImpl();
        List<Doctor> doctordaoList = null;
        try {
            doctordaoList = doctordaoimpl.findAll(HospitalID,DepartmentID); // 调用 findAll() 函数获取全部用户信息
        } catch (Exception e) {
            e.printStackTrace();
        }
        assert doctordaoList != null;
    %>
    <div>
        <table>
            <thead>
            <tr>
                <th>医生编号</th>
                <th>医生姓名</th>
                <th>医生性别</th>
                <th>医生年龄</th>
                <th>医生年龄</th>
                <th>医生所属医院</th>
                <th>医生所属科室</th>
                <th>职称</th>
                <th>介绍</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%for (Doctor doctor : doctordaoList) { %>
            <tr>
                <td><%=doctor.getId() %></td>
                <td><%=doctor.getName() %>></td>
                <td><%=doctor.getSex() %></td>
                <td><%=doctor.getAge()%></td>
                <td><%=doctor.getPhone()%></td>
                <td><%=doctor.getPart() %></td>
                <td><%=doctor.getPart2() %></td>
                <td><%=doctor.getPart3()%></td>
                <td><span class="introduction"><%=doctor.getDiscript()%></span></td>
                <td>
                    <button class="button" type="submit" onclick="SelectDoctor(<%=UserID%>,<%=HospitalID%>,<%=DepartmentID%>,<%=doctor.getId()%>); return false;">选择该科室</button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function SelectDoctor(UserID, HospitalID, DepartmentID,DoctorID) {
        // 在这里进行页面跳转
        window.location.href = "./PatientSelectTime.jsp?UserID=" + UserID+"&HospitalID=" +HospitalID + "&DepartmentID=" + DepartmentID+"&DoctorID="+DoctorID;
    }
</script>

</body>
</html>