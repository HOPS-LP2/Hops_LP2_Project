<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/home.css">
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
                    <section class="search">
                        <form>
                            <div class="available">
                                <h3>
                                    <fmt:message key="home.check-availability" />
                                </h3>
                            </div>
                            <label for="location" id="label-location">Escolha uma agência:</label>
                            <div class="search-items">
                                <div style="position: relative;" class="search-input">
                                    <input type="text" id="location" name="location" class="form-control" placeholder="<fmt:message key='home.enter-adress' />" autocomplete="off" />
                                    <div id="agenciesList"></div>
                                </div>
                                <button type="submit" class="btn-search">Search<img src="${pageContext.request.contextPath}/resources/public/icons/btn-img.png" class="btn-img" /></button>
                            </div>
                        </form>
                    </section>

                    <section>
                        <div class="slider-text">
                            <h1>
                                <fmt:message key="home.popular" />
                            </h1>
                        </div>
                        <div class="touch-slider">
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/fiat.png" />
                                </div>
                                <h1>FIAT Mobi</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/nissan.png" />
                                </div>
                                <h1>NISSAN Versa Sense</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div>
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                            <div class="last-slide">
                                <div class="slide"><img
                                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png" />
                                </div>
                                <h1>BMW X6</h1>
                            </div>
                        </div>
                    </section>
                </main>

                <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                <script src="${pageContext.request.contextPath}/resources/scripts/home.js"></script>
                <script src="${pageContext.request.contextPath}/resources/scripts/getAgencies.js"></script>
            </body>

            </html>