<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script th:src="{${contextPath}/resources/js/main.js}"></script>
  <title>Регистрация</title>
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
<div class="registration-page">
  <div class="form">

  <form:form method="POST" modelAttribute="userForm">
    <div>
      <form:input type="text" path="username" placeholder="Username"
                  autofocus="true"></form:input>
      <form:errors path="username" cssClass="form-error"></form:errors>
    </div>
    <div>
      <form:input type="password" path="password" placeholder="Password"></form:input>
    </div>
    <div>
      <form:input type="password" path="passwordConfirm"
                  placeholder="Confirm your password"></form:input>
      <form:errors path="passwordConfirm" cssClass="form-error"></form:errors>
    </div>
    <button type="submit">Зарегистрироваться</button>
  </form:form>
    <p class="message">Уже есть аккаунт? <a href="/">Войти </a></p>
</div>
</div>
</body>
</html>