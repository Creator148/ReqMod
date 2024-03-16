<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>

<header>
    <nav class="up">
        <div class = formkek>
            <a href="<%=request.getContextPath()%>/" style="text-decoration: none;color: #2a2a26">Todo App</a>
        </div>
        <div class="logout">
            <a href="<%=request.getContextPath()%>/logout"
               class="nav-link">Logout</a><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 192 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l210.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128zM160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 32C43 32 0 75 0 128L0 384c0 53 43 96 96 96l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l64 0z"/></svg>
        </div>
    </nav>
</header>
<form class="row g-3 for-add" method="post" action="/add-todo" >

    <div class="form-control-title">
        <input type="text" class="form-control-input-title" name="title" id="inputAddress" placeholder="Название задачи">
    </div>
    <textarea class="form-control-input-desc" name="description" id="inputAddress2" placeholder="Описание задачи"></textarea>
    <div class="form-control-data">
        <input type="datetime-local" class="form-control-input-data" name="targetDate">
    </div>
    <div class="box">
        <div class="form-group">
            <label for="statusSelect">Статус задачи</label>
            <select class="form-control4" id="statusSelect"  name="isDone" typeof="text">
                <option value="true">Выполнено</option>
                <option value="false">В работе</option>
            </select>
        </div>
    </div>
    <div class="box" style="color: #d2731b">
        <button type="submit" class="button-3">Сохранить</button>
    </div>
</form>

</html>