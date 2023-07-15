<%@ page import="hospital.dao.impl.PatientDaoImpl" %>
<%@ page import="hospital.user.Patient" %><%
    PatientDaoImpl patientDaoImpl = new PatientDaoImpl();
    Patient patient = patientDaoImpl.find(Integer.parseInt(request.getParameter("UserID")));
    assert  patient == null;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新个人信息</title>
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/update.css">
    <script>
        function showMessage(message) {
            alert(message);
        }
    </script>
</head>
<body>
<div class="top-bar">
    <div class="login-page">更新页面</div>
</div>
<form action="PatientUpdate" method="post">
    <table>
        <input type="hidden" name="UserID" value="<%= request.getParameter("UserID") %>">
        <%--第一行:姓名--%>
        <tr>
            <td><label for="name">姓名</label> </td>
            <td><input type="text" name="name" id="name" value="<%= patient.getName()%>"></td>
        </tr>
        <!-- 第四行:年龄 -->
        <tr>
            <td><label for="age">年龄</label></td>
            <td><input type="text" name="age" id="age" value="<%= patient.getAge()%>"></td>
        </tr>
            <td><input type="radio" name="sex" value="男">男</td>
            <td><input type="radio" name="sex" value="女">女</td>
        </tr>
        <%--第六行:邮箱--%>
        <tr>
            <td><label for="email">邮箱</label> </td>
            <td><input type="text" name="email" id="email" value="<%= patient.getEmail()%>"></td>
        </tr>
        <%--第七行:身份证号码--%>
        <tr>
            <td><label for="idCard" >身份证号码</label> </td>
            <td><input type="text" name="idCard" id="idCard" value="<%= patient.getIdCard()%>"></td>
        </tr>
        <%--第八行:出生年月--%>
        <tr>
            <td><label for="DateOfBirth">出生年月</label> </td>
            <td><input type="date" name="DateOfBirth" id="DateOfBirth" pattern="\d{4}-\d{2}-\d{2}" value="<%= patient.getDateOfBirth()%>"><td>
        </tr>
        <%--第九行:手机号码--%>
        <tr>
            <td><label for="PhoneNumber">手机号码</label> </td>
            <td><input type="text" name="PhoneNumber" id="PhoneNumber" value="<%= patient.getPhoneNumber()%>"></td>
        </tr>
        <%--第五行:更新+重置按钮--%>
        <tr>
            <td><input type="submit" value="更新"></td>
            <td><input type="reset" value="重置"></td>
        </tr>
    </table>
</form>

<div class="bottom-bar"></div>
<% if (request.getAttribute("Errormessage") != null) { %>
<script>
    showMessage("<%= request.getAttribute("Errormessage") %>");
</script>
<% } %>
</body>
</html>
