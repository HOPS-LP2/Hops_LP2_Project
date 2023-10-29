<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="icon" href="${pageContext.request.contextPath}/favicon.ico" />
                <title>
                    <fmt:message key="home.title" /> &VerticalLine; HOPS
                </title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/general.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/home.css">
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
                        <a href="${pageContext.request.contextPath}/home">
                            <img src="${pageContext.request.contextPath}/public/icons/home-img.png"
                                class="representation-img" />
                        </a>
                        <a href="${pageContext.request.contextPath}/home">
                            <p class="text-header">
                                <fmt:message key="general.home" />
                            </p>
                        </a>

                        <div class="line"></div>

                        <a href="${pageContext.request.contextPath}/catalog">
                            <img src="${pageContext.request.contextPath}/public/icons/car-img.png"
                                class="representation-img">
                        </a>
                        <a href="${pageContext.request.contextPath}/catalog">
                            <p class="text-header">
                                <fmt:message key="general.cars" />
                            </p>
                        </a>

                        <div class="line"></div>

                        <a href="${pageContext.request.contextPath}/agencies">
                            <img src="${pageContext.request.contextPath}/public/icons/agencies-img.png"
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
                                <img src="${pageContext.request.contextPath}/public/icons/user-img.png"
                                    class="representation-img" />
                                <a href="${pageContext.request.contextPath}/login">
                                    <p class="text-header">${sessionScope.userName}</p>
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login">
                                <div class="login-access">
                                    <a href="${pageContext.request.contextPath}/login">
                                        <img src="${pageContext.request.contextPath}/public/icons/user-img.png"
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
                    <section class="search">
                        <form>
                            <div style="margin-bottom: 1vh;">
                                <h3 style="font-weight: 500;">
                                    <fmt:message key="home.check-availability" />
                                </h3>
                            </div>
                            <div class="div-special">
                                <div>
                                    <label for="location">
                                        <fmt:message key="home.location" />
                                    </label>
                                    <input type="text" name="location" id="location" style="width: 15vw;"
                                        placeholder="<fmt:message key='home.enter-adress' />" />
                                </div>
                                <div style="margin-left: 2vw;">
                                    <label for="date">
                                        <fmt:message key="home.date" />
                                    </label>
                                    <input type="date" name="date" id="date" style="width: 6vw;" />
                                </div>
                                <div style=" margin-left: 2vw;">
                                    <label for="time">
                                        <fmt:message key="home.time" />
                                    </label>
                                    <input type="time" name="time" id="time" style="width: 6vw;" />
                                </div>
                                <div style="margin-left: 2vw;">
                                    <button type="submit" class="btn-search">Search <img
                                            src="${pageContext.request.contextPath}/public/icons/btn-img.png"
                                            class="btn-img" /></button>
                                </div>
                            </div>
                        </form>
                    </section>

                    <section>
                        <div>
                            <h1 style="margin: 0 0 5vh 20vw;">
                                <fmt:message key="home.popular" />
                            </h1>
                        </div>
                        <div class="touch-slider">
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/fiat.png" />
                                </div>
                                <h1>FIAT Mobi</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/public/cars/nissan.png" />
                                </div>
                                <h1>NISSAN Versa Sense</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div style="margin-right: 2rem;">
                                <div class="slide"><img src="${pageContext.request.contextPath}/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                        </div>
                    </section>
                </main>

                <script src="${pageContext.request.contextPath}/scripts/home.js"></script>
            </body>

            </html>