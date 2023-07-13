<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/20
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医生注册</title>

    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
<div class="top-bar">
    <div class="login-page">注册页面</div>
</div>
<form action="DoctorRegister" method="post">
    <table>
        <%--第一行:姓名--%>
        <tr>
            <td><label for="name">姓名</label></td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <!--第二行:密码-->
        <tr>
            <td><label for="password">密码</label></td>
            <td><input type="password" name="password" id="password"></td>
        </tr>
        <%--第三行:确认密码--%>
        <tr>
            <td><label for="r_password">确认密码</label></td>
            <td><input type="password" name="r_password" id="r_password"></td>
        </tr>
        <%--第四行:性别--%>
        <tr>
            <td><input type="radio" name="sex" value="男">男</td>
            <td><input type="radio" name="sex" value="女">女</td>
        </tr>
        <%--第五行:年龄--%>
        <tr>
            <td><label for="age">年龄</label></td>
            <td><input type="text" name="age" id="age"></td>
        </tr>
        <%--第六行:电话--%>
        <tr>
            <td><label for="phone">电话</label></td>
            <td><input type="text" name="phone" id="phone"></td>
        </tr>


        <%--第七行:所属医院--%>
        <tr>
            <td><strong>所属医院</strong></td>
            <td>
                <select name="part1">
                    <option value="桂林医学院附属医院">桂林医学院附属医院</option>
                    <option value="桂林中医医院">桂林中医医院</option>
                    <option value="中国人民解放军第一八一医院">中国人民解放军第一八一医院</option>
                    <option value="桂林市人民医院">桂林市人民医院</option>
                    <option value="桂林市第二人民医院">桂林市第二人民医院</option>
                    <option value="桂林市第五人民医院">桂林市第五人民医院</option>
                    <option value="桂林市妇女儿童医院">桂林市妇女儿童医院</option>
                    <option value="桂林市第三人民医院">桂林市第三人民医院</option>
                    <option value="灵川县疾病预防控制中心">灵川县疾病预防控制中心</option>
                    <option value="兴安县疾病预防控制中心">兴安县疾病预防控制中心</option>
                    <option value="兴安县界首中心卫生院">兴安县界首中心卫生院</option>
                    <option value="恭城县人民医院">恭城县人民医院</option>
                </select>
            </td>
        </tr>

        <%--第八行:科室(设置六个科室可供选择)--%>
        <tr>
            <td><strong>所属科室</strong></td>
            <td>
                <select name="part2">
                    <optgroup label="内科">
                        <option value="呼吸内科">呼吸内科</option>
                        <option value="消化内科">消化内科</option>
                        <option value="神经内科">神经内科</option>
                        <option value="心血管内科">心血管内科</option>
                        <option value="肾内科">肾内科</option>
                        <option value="血液内科">血液内科</option>
                        <option value="免疫科">免疫科</option>
                        <option value="内分泌科">内分泌科</option>
                    </optgroup>

                    <optgroup label="外科">
                        <option value="普通外科">普通外科</option>
                        <option value="神经外科">神经外科</option>
                        <option value="心胸外科">心胸外科</option>
                        <option value="泌尿外科">泌尿外科</option>
                        <option value="心血管外科">心血管外科</option>
                        <option value="乳腺外科">乳腺外科</option>
                        <option value="肝胆外科">肝胆外科</option>
                        <option value="器官移植">器官移植</option>
                        <option value="肛肠外科">肛肠外科</option>
                        <option value="烧伤科">烧伤科</option>
                        <option value="骨外科">骨外科
                        <option>
                        <option value="妇产科">妇产科</option>
                    </optgroup>

                    <optgroup label="妇科">
                        <option value="产科">产科</option>
                        <option value="生育计划">生育计划</option>
                        <option value="妇幼保健">妇幼保健</option>
                    </optgroup>

                    <optgroup label="男科"></optgroup>

                    <optgroup label="儿科">
                        <option value="儿科综合">儿科综合</option>
                        <option value="小儿内科">小儿内科</option>
                        <option value="小儿外科">小儿外科</option>
                        <option value="新生儿科">新生儿科</option>
                        <option value="儿童营养保健科">儿童营养保健科</option>
                    </optgroup>

                    <optgroup label="五官科">
                        <option value="耳鼻喉科">耳鼻喉科</option>
                        <option value="眼科">眼科</option>
                        <option value="口腔科">口腔科</option>
                    </optgroup>

                    <optgroup label="肿瘤科">
                        <option value="肿瘤内科">肿瘤内科</option>
                        <option value="肿瘤外科">肿瘤外科</option>
                        <option value="肿瘤妇科">肿瘤妇科</option>
                        <option value="骨肿瘤科">骨肿瘤科</option>
                        <option value="放疗科">放疗科</option>
                        <option value="肿瘤康复科">肿瘤康复科</option>
                        <option value="肿瘤综合科">肿瘤综合科</option>
                    </optgroup>

                    <optgroup label="皮肤性病科">
                        <option value="皮肤科">皮肤科</option>
                        <option value="性病科">性病科</option>
                    </optgroup>

                    <optgroup label="中医科"></optgroup>

                </select>
            </td>
        </tr>

        <%--第九行:职称--%>
        <tr>
            <td><strong>职称</strong></td>
            <td>
                <select name="part3">
                    <option value="院长">院长</option>
                    <option value="副院长">副院长</option>
                    <option value="主任医师">主任医师</option>
                    <option value="副主任医师">副主任医师</option>
                    <option value="主治医生">主治医生</option>
                </select>
            </td>
        </tr>

        <%--第十行:个人介绍--%>
        <tr>
            <td>个人介绍</td>
            <td>
                <textarea name="discript" rows="5" cols="50" id="discript"></textarea>
            </td>
        </tr>

        <%--第十一行:注册+重置按钮--%>
        <tr>
            <td><input type="submit" value="注册"></td>
            <%--            <td><input type="reset" value="重置"></td>--%>
        </tr>
        <tr>
            <td>
                <a href="DoctorLogin.jsp">
                    登录
                </a>
            </td>
        </tr>
    </table>
</form>
<div class="bottom-bar"></div>
</body>
</html>
