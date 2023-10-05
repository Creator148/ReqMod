<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Логин</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
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