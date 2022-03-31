<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <td></td>
                <td></td>

            </tr>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.title}</td>
                    <td>${course.length}</td>
                    <td>${course.description}</td>
                    <td><a href="courses/update/${course.id}">Изменить</a> </td>
                    <td><a href="courses/delete/${course.id}">Удалить</a> </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
            <a href="courses/update/0">Добавить...</a>
        </div>
    </div>
    </div>

</div>
</body>
</html>