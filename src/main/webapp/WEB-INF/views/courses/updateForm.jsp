<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Курс</title>
    <style>
        form fieldset {
            width: 40%;
        }

        form fieldset label {
            display: block;
            /*width : 50%;
            float :left;*/
        }

        form fieldset input, form fieldset textarea {
            width: 100%;
        }
    </style>
    <script>
        var disableForm = true;
        <s:authorize access="hasRole('ROLE_USER')">
            disableForm = false;
        </s:authorize>

        window.addEventListener("load", function () {
            if (disableForm) {
                var inputs = document.querySelectorAll("form fieldset input, form fieldset textarea")
                for (var i = 0; i < inputs.length; i++)
                    inputs[i].disabled = true;
            }
        })

    </script>

</head>
<body>
<h1>Курс</h1>
<form method="POST">
    <fieldset>
        <div>
            <label>Название: </label>
            <input type="text" name="title" value="${course.title}">
        </div>
        <div>
            <label>Длительность: </label>
            <input type="number" name="length" value="${course.length}">
        </div>
        <div>
            <label>Описание: </label>
            <textarea name="description" rows="7">${course.description}</textarea>
        </div>
        <div>
            <input type="submit" value="Сохранить">
        </div>
    </fieldset>

</form>

</body>
</html>