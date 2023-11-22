<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>
                    <fmt:message key="login.title" /> &VerticalLine; HOPS
                </title>
                <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/confirmRental.css">
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

                    <div class="login-access">
                        <a href="${pageContext.request.contextPath}/login">
                            <img src="${pageContext.request.contextPath}/resources/public/icons/user-img.png"
                                class="representation-img" /></a>
                        <a href="${pageContext.request.contextPath}/login">
                            <p class="text-header">
                                <fmt:message key="general.login" />
                            </p>
                        </a>
                    </div>

                </header>

                <main>
                    <div class="grid-rental">
                        <div class="rental-item">1</div>
                        <div class="rental-item">2</div>
                        <div class="rental-item">3</div>
                        <div class="rental-item">4</div>
                        <div class="rental-item">5</div>
                        <form action="${pageContext.request.contextPath}/payment" method="post" class="rental-color">
                            <div class="rental-item-pay">
                                <h1>
                                    <fmt:message key="confirmRental.price" />
                                </h1>
                                <div class="input-div">
                                    <input type="number" name="card-number" id="card-number"
                                        placeholder="<fmt:message key='confirmRental.card-number' />"
                                        value="${not empty card-number ? card-number : ''}" />
                                </div>
                                <div class="input-div">
                                    <input type="text" name="card-name" id="card-name"
                                        placeholder="<fmt:message key='confirmRental.card-name' />"
                                        value="${not empty card-name ? card-name : ''}" />
                                </div>
                                <div class="input-div">
                                    <input type="text" name="card-validity" id="card-validity"
                                        placeholder="<fmt:message key='confirmRental.card-validity' />"
                                        value="${not empty card-validity ? card-validity : ''}" />
                                </div>
                                <div class="input-div">
                                    <input type="text" name="card-cvv" id="card-cvv"
                                        placeholder="<fmt:message key='confirmRental.card-cvv' />"
                                        value="${not empty card-cvv ? card-cvv : ''}" />
                                </div>

                                <!-- <a href="${pageContext.request.contextPath}/recover">
                                    <span>
                                        <fmt:message key="login.forgot" />
                                    </span>
                                </a>
                                <c:choose>
                                    <c:when test="${errorLogin == 'login.invalid'}">
                                        <p id="warning">
                                            <fmt:message key='${errorLogin}' />
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p id="warning">${errorLogin}</p>
                                    </c:otherwise>
                                </c:choose>

                                <c:if test="${not empty param.signup}">
                                    <p id="right">
                                        <fmt:message key="login.signupSuccessful" />
                                    </p>
                                </c:if>

                                <div class="login-btns">
                                    <a href="${pageContext.request.contextPath}/signup">
                                        <button type="button" class="btn-signup">
                                            <fmt:message key="login.signup" />
                                        </button>
                                    </a>
                                    <button type="submit" class="btn-login">
                                        <fmt:message key="login.login" />
                                    </button>
                                </div> -->
                            </div>
                        </form>
                    </div>
                    </form>
                </main>
            </body>

            </html>