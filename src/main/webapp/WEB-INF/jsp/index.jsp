<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Логин</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script th:src="{${contextPath}/resources/js/main.js}"></script>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<header class="header">
    <div class = "header-container">
      <a href="<%=request.getContextPath()%>/" class="reqmod-header">ReqMod</a>
    </div>
    <div class="logout">
      <a href="<%=request.getContextPath()%>/logout"
         class="nav-link">Logout<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
      <path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 192 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l210.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128zM160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 32C43 32 0 75 0 128L0 384c0 53 43 96 96 96l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l64 0z"></path>
      </svg></a>
    </div>
</header>
<div class="login-page">
  <div class="form">
    <form method="POST" action="/">
      <sec:authorize access="!isAuthenticated()">
      <h3>${pageContext.request.userPrincipal.name}</h3>
      <input name="username" type="text" placeholder="Username"
             autofocus="true"/>
      <input name="password" type="password" placeholder="Password"/>
      <button type="submit">Войти</button>
      <p class="message">Не зарегистрированы? <a href="/registration">Зарегистрироваться </a></p>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
        <h4><a href="/list-todo">Главная</a></h4>
        <h4><a href="/logout">Выйти</a></h4>
      </sec:authorize>
    </form>
  </div>

</div>
</body>
</html>