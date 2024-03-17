<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Проекты</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<c:url value="/js/generateRandomColor.js"/>"></script>
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
        <span class="text">Проекты</span>
    </div>
    <div class="masonry-layout">
        <c:forEach var="project" items="${projects}">
            <div class="masonry-layout__panel randomColorPanel">
                <div class="masonry-layout__panel-name">${project.name}</div>
                <div class="masonry-layout__panel-status">${project.status.name}</div>
                <div class="masonry-layout__panel-active">
                    <c:choose>
                        <c:when test="${project.active}">
                            Активный
                        </c:when>
                        <c:otherwise>
                            Неактивный
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>

        <form action="<%=request.getContextPath()%>/create-project" method="post" class="masonry-layout__panel randomColorPanel">
            <label for="name" class="masonry-layout__panel-name">Новый проект</label>
            <input class="text-field__input" type="text" id="name" name="name" required>
            <button type="button" class="button">+</button>
        </form>
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
<script>
    var panels = document.querySelectorAll('.randomColorPanel');
    panels.forEach(function(panel) {
        panel.style.backgroundColor = generateRandomColor();
    });

    function generateRandomColor() {
        const minChannelValue = 50; // минимальное значение для канала цвета (0-255)
        const maxChannelValue = 205; // максимальное значение для канала цвета (0-255)
        const minAlpha = 0.5; // минимальная прозрачность (0-1)
        const maxAlpha = 1; // максимальная прозрачность (0-1)

        let color = 'rgba(';
        for (let i = 0; i < 3; i++) {
            color += Math.floor(Math.random() * (maxChannelValue - minChannelValue + 1) + minChannelValue) + ',';
        }
        const alpha = Math.random() * (maxAlpha - minAlpha) + minAlpha; // случайное значение для прозрачности
        color += alpha.toFixed(2) + ')';
        return color;
    }
</script>
</body>
</html>

