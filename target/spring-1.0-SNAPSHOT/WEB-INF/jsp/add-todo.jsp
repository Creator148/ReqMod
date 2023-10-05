<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>

<!DOCTYPE HTML>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>





<nav class="up">
    <div class = formkek>
        <a href="<%=request.getContextPath()%>/" style="text-decoration: none;color: #2a2a26">Todo App</a>
    </div>
    <div class="logout">
        <a href="<%=request.getContextPath()%>/logout"
           class="nav-link">Logout</a><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 192 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l210.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128zM160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 32C43 32 0 75 0 128L0 384c0 53 43 96 96 96l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l64 0z"/></svg>
    </div>
</nav>
<form class="row g-3" method="post" action="/add-todo" >

    <div class="col-12">

        <input type="text" class="form-control" name="title" id="inputAddress" placeholder="Название задачи">
    </div>
    <div class="col-12">

        <input type="text" class="form-control" name="description" id="inputAddress2" placeholder="Описание задачи">
    </div>
    <div class="col-12">
        <input type="datetime-local" class="form-control" name="targetDate">
    </div>
    <div class="box">
        <div class="form-group">
            <label for="statusSelect">Статус задачи</label>
            <select class="form-control" id="statusSelect"  name="isDone">
                <option value="true">Выполнено</option>
                <option value="false">В работе</option>
            </select>
        </div>
    </div>

    <div class="box" style="color: #d2731b">
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </div>
</form>

</html>

</body>
</html>