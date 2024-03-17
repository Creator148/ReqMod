<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Регистрация</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script th:src="{${contextPath}/resources/js/main.js}"></script>
  <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="sidebar close">
  <div class="logo-details">
    <i ></i>
    <span class="logo_name">ReqMod</span>
  </div>
  <ul class="nav-links">
    <li>
      <a href="#">
        <i class='bx bx-grid-alt' ></i>
        <span class="link_name">Главная</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="#">Category</a></li>
      </ul>
    </li>
    <li>
      <div class="iocn-link">
        <a href="#">
          <i class='bx bx-collection' ></i>
          <span class="link_name">Проекты</span>
        </a>
        <i class='bx bxs-chevron-down arrow' ></i>
      </div>
      <ul class="sub-menu">
        <li><a class="link_name" href="#">Проекты</a></li>
        <c:forEach var="project" items="${projects}">
          <li><a href="#">${project.name}</a></li>
        </c:forEach>
      </ul>
    </li>
    <li>
      <a href="#">
        <i class='bx bx-grid-alt' ></i>
        <span class="link_name">Требования</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="#">Category</a></li>
      </ul>
    </li>

    <li>
      <a href="/admin">
        <i class='bx bx-cog' ></i>
        <span class="link_name">Настройки</span>
      </a>
      <ul class="sub-menu blank">
        <li><a class="link_name" href="/admin">Настройки</a></li>
      </ul>
    </li>
    <li>
      <div class="profile-details">
        <div class="profile-content">

        </div>
        <div class="name-job">
          <div class="profile_name">${userInfo.username}</div>
          <div class="role">
            <c:forEach items="${userInfo.roles}" var="role">
              <c:if test="${role.priority eq 'MAIN'}">
                ${role.name}
              </c:if>
            </c:forEach>
          </div>
        </div>
        <a href="/logout">
          <i class='bx bx-log-out'></i>
        </a>
      </div>
    </li>
  </ul>
</div>
<section class="home-section">
  <div class="home-content">
    <i class='bx bx-menu' ></i>
    <span class="text">Вход</span>
  </div>
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
</section>
<script>
  let arrow = document.querySelectorAll(".arrow");
  for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
      let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
      arrowParent.classList.toggle("showMenu");
    });
  }
  let sidebar = document.querySelector(".sidebar");
  let sidebarBtn = document.querySelector(".bx-menu");
  console.log(sidebarBtn);
  sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
  });
</script>
</body>
</html>