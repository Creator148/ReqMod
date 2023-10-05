<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>User Management Application</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>

</head>
<body>
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

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Список задач</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/add-todo"
               class="btn btn-success" style="text-decoration: none;font-weight: normal;line-height: 2em;color: #d2731b">Добавить задачу</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th class="column">Название задачи</th>
                <th class="column">Описание</th>
                <th class="column">Дедлайн</th>
                <th class="column">Статус</th>
                <th class="column">Действия</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="todo" items="${listTodo}">
                <tr>
                    <td><c:out value="${todo.title}" /></td>
                    <td>
                        <textarea class="out-desc" readonly>  <c:out value="${todo.description}" /></textarea>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${empty todo.targetDate}">
                                Без даты
                            </c:when>
                            <c:otherwise>
                                <script>
                                    function formatDateTime(dateTimeStr) {
                                        const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
                                        return new Date(dateTimeStr).toLocaleString(undefined, options);
                                    }
                                    document.write(formatDateTime("${todo.targetDate}"));
                                </script>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${todo.is_done}">
                                Выполнена
                            </c:when>
                            <c:otherwise>
                                В работе
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                    <a href="update-todo?id=<c:out value='${todo.id}' />" style="text-decoration: none;font-size:30px;color: #2a2a26">&#9998</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a
                                href="delete?id=<c:out value='${todo.id}' />" style="text-decoration: none;font-size:30px;color: #2a2a26">&#128465</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>
</body>
</html>
