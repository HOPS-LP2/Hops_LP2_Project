<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@page import="com.example.javawebapp.car.Car" %>
            <%@page import="java.util.List" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico" />

                <title>
                    <fmt:message key="home.title" /> &VerticalLine; HOPS
                </title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
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
                                class="representation-img" />
                        </a>
                        <a href="${pageContext.request.contextPath}/">
                            <p class="text-header">
                                <fmt:message key="general.home" />
                            </p>
                        </a>

                        <div class="line"></div>

                        <a href="${pageContext.request.contextPath}/catalog">
                            <img src="${pageContext.request.contextPath}/resources/public/icons/car-img.png"
                                class="representation-img">
                        </a>
                        <a href="${pageContext.request.contextPath}/catalog">
                            <p class="text-header">
                                <fmt:message key="general.cars" />
                            </p>
                        </a>

                        <div class="line"></div>

                        <a href="${pageContext.request.contextPath}/agencies">
                            <img src="${pageContext.request.contextPath}/resources/public/icons/agencies-img.png"
                                class="representation-img">
                        </a>
                        <a href="${pageContext.request.contextPath}/agencies">
                            <p class="text-header">
                                <fmt:message key="general.agencies" />
                            </p>
                        </a>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.loggedIn == true}">
                            <div class="login-access">
                                <img src="${pageContext.request.contextPath}/resources/public/icons/user-img.png"
                                    class="representation-img" />

                                <p class="text-header">${sessionScope.username}</p>

                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login">
                                <div class="login-access">
                                    <a href="${pageContext.request.contextPath}/login">
                                        <img src="${pageContext.request.contextPath}/resources/public/icons/user-img.png"
                                            class="representation-img" />
                                    </a>
                                    <a href="${pageContext.request.contextPath}/login">
                                        <p class="text-header">
                                            <fmt:message key="general.login" />
                                        </p>
                                    </a>
                                </div>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </header>

                <main>
                    <div class="container mt-5 d-flex justify-content-center">
                        <div class="row d-flex justify-content-center">
                            <c:forEach var="car" items="${carsList}">
                                <div class="card m-3" style="width: 20rem;">
                                    <img src="${pageContext.request.contextPath}/resources/public/cars/${car.image_path}" class="card-img-top" alt="carro" style="background-color: #e2e2e2">
                                    <div class="card-body d-flex justify-content-between align-items-center">
                                        <div>
                                            <h5 class="card-title">${car.model} ${car.year}</h5>
                                            <p class="card-text">
                                                A partir de R$<fmt:formatNumber type="currency" value="${car.price}" currencySymbol="" maxFractionDigits="2" />
                                            </p>
                                        </div>
                                        <div>
                                            <a href="#" class="btn rent-button-js" data-car-id="${car.car_id}" style="background-color: #d99bd3; font-weight: bold; color: black">Alugar</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </main>
                
                <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                <script src="${pageContext.request.contextPath}/resources/scripts/showCars.js"></script>
            </body>

            </html>