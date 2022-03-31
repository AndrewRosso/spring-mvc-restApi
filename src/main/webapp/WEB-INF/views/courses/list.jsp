<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Курсы</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />"
          rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
    <h1>CПЕЦИАЛИСТ.РУ</h1>
        <div id="userinfo">
            <s:authorize access="isAuthenticated()">Привет,
                <s:authentication property="principal.username" />!
                <br/>
                <a href="../j_spring_security_logout">Выход</a>
            </s:authorize>
        </div>
        <s:authorize access="isAnonymous()">
            <form id="login" name="loginForm" action="../j_spring_security_check"
                  method="POST">
                <label>Логин: </label>
                <input type="text" name="j_username">
                <label>Пароль: </label>
                <input type="password" name="j_password">
                <input type="submit" name="submit" value="Войти">
            </form>
        </s:authorize>

    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title">Список курсов</div>
        </div>
        <div class="panel-body">
    <c:if test="${not empty courses}">
        <table class="table table-striped table-bordered">
            <tr>
                <td>Название</td>
                <td>Длительность</td>
                <td>Описание</td>
                <s:authorize access="hasRole('ROLE_USER')">
                    <td></td>
                    <td></td>
                </s:authorize>
            </tr>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.title}</td>
                    <td>${course.length}</td>
                    <td>${course.description}</td>
                    <s:authorize access="hasRole('ROLE_USER')">
                        <td><a href="courses/update/${course.id}">Изменить</a> </td>
                        <td><a href="courses/delete/${course.id}">Удалить</a> </td>
                    </s:authorize>
                </tr>
            </c:forEach>
        </table>
    </c:if>
            <s:authorize access="hasRole('ROLE_USER')">
            <a href="courses/update/0">Добавить...</a>
            </s:authorize>
        </div>
    </div>
    </div>

</div>
</body>
</html>