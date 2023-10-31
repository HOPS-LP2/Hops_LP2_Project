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
                    <fmt:message key="catalog.title" /> &VerticalLine; HOPS
                </title>
                <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/catalog.css">
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
                                <a href="${pageContext.request.contextPath}/login">
                                    <p class="text-header">${sessionScope.userName}</p>
                                </a>
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
                    <header>
                        <h1 style="font-size: 30px; margin: 0;">
                            <fmt:message key="catalog.vehicles" />
                        </h1>
                        <div class="search">
                            <div class="search-box-wrapper">
                                <input type="text" class="search-input" placeholder="Search">
                                <img class="search-icon"
                                    src="${pageContext.request.contextPath}/resources/public/icons/btn-img.png">
                            </div>

                            <select name="sort" id="sort" class="search-select">
                                <option value="mais-relevante">
                                    <fmt:message key="catalog.most-relevant" />
                                </option>
                                <option value="menor-preco">
                                    <fmt:message key="catalog.price-low-to-high" />
                                </option>
                                <option value="maior-preco">
                                    <fmt:message key="catalog.price-high-to-low" />
                                </option>
                            </select>
                        </div>
                    </header>
                    <section class="catalog">
                        <div class="filter"></div>
                        <div class="cars">
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="product"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" /></div>
                                <h1>BMW X6</h1>
                            </div>
                        </div>
                    </section>
                </main>
            </body>

            </html>