<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.example.javawebapp.agency.Agency" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico"/>
    <title>
        <fmt:message key="home.title"/> &VerticalLine; HOPS
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/agencies.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet">
</head>

<body>
<header>
    <div>
        <h1 class="logo">HOPS</h1>
    </div>
    <div class="quick-access">
        <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/resources/public/icons/home-img.png"
                 class="representation-img"/>
        </a>
        <a href="${pageContext.request.contextPath}/">
            <p class="text-header">
                <fmt:message key="general.home"/>
            </p>
        </a>

        <div class="line"></div>

        <a href="${pageContext.request.contextPath}/catalog">
            <img src="${pageContext.request.contextPath}/resources/public/icons/car-img.png"
                 class="representation-img">
        </a>
        <a href="${pageContext.request.contextPath}/catalog">
            <p class="text-header">
                <fmt:message key="general.cars"/>
            </p>
        </a>

        <div class="line"></div>

        <a href="${pageContext.request.contextPath}/agencies">
            <img src="${pageContext.request.contextPath}/resources/public/icons/agencies-img.png"
                 class="representation-img">
        </a>
        <a href="${pageContext.request.contextPath}/agencies">
            <p class="text-header">
                <fmt:message key="general.agencies"/>
            </p>
        </a>
    </div>
    <c:choose>
        <c:when test="${sessionScope.loggedIn == true}">
            <div class="login-access">
                <img src="${pageContext.request.contextPath}/resources/public/icons/user-img.png"
                     class="representation-img"/>

                <p class="text-header">${sessionScope.username}</p>

            </div>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/login">
                <div class="login-access">
                    <a href="${pageContext.request.contextPath}/login">
                        <img src="${pageContext.request.contextPath}/resources/public/icons/user-img.png"
                             class="representation-img"/>
                    </a>
                    <a href="${pageContext.request.contextPath}/login">
                        <p class="text-header">
                            <fmt:message key="general.login"/>
                        </p>
                    </a>
                </div>
            </a>
        </c:otherwise>
    </c:choose>
</header>
<main>
    <% List<Agency> agencies = (List<Agency>) request.getAttribute("list_agency");
        if (agencies != null) {
            for (Agency agency : agencies) { %>
    <div class="agency-info">
        <div class="img-block">
            <img src="${pageContext.request.contextPath}/resources/favicon.ico">
        </div>
        <div class="text">
            <h4><%= agency.getName() %>
            </h4>
            <small><%= agency.getAddress() %> - <%= agency.getCity() %>
            </small>
        </div>
        <div class="horario">
            <small>Horário de Funcionamento: 8h às 20h</small>
        </div>
    </div>
    <% }
    } else { %>
    <p>A lista de agências está vazia ou nula.</p>
    <% } %>
</main>
</body>

</html>