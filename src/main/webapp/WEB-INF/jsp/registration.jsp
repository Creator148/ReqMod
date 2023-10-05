<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <title>Регистрация</title>
</head>
<body>
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