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
                    <fmt:message key="resetPassword.title" /> &VerticalLine; HOPS
                </title>
                <link rel="icon" href="${pageContext.request.contextPath}/resources/favicon.ico" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/resetPassword.css">
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
                    <form action="../reset" method="post" class="reset-color" id="reset-form">
                        <div class="reset">
                            <h1>
                                <fmt:message key="resetPassword.reset-password" />
                            </h1>
                            <div class="input-div">

                                <img src="${pageContext.request.contextPath}/resources/public/icons/password-icon.png"
                                    alt="password-icon">

                                <input type="password" name="password" id="password"
                                    placeholder="<fmt:message key='resetPassword.new-password' />" />

                                <img src="${pageContext.request.contextPath}/resources/public/icons/eye-open.png"
                                    alt="eye-icon" class="show-password">

                            </div>
                            <div id="input-div">

                                <img src="${pageContext.request.contextPath}/resources/public/icons/password-icon.png"
                                    alt="password-icon">

                                <input type="password" name="confirm-password" id="confirm-password"
                                    placeholder="<fmt:message key='resetPassword.confirm-password' />" />

                                <img src="${pageContext.request.contextPath}/resources/public/icons/eye-open.png"
                                    alt="eye-icon" class="show-confirm-password">

                            </div>
                            <p id="wrong"></p>
                            <div class="reset-btn">
                                <button type="submit" class="btn-reset">
                                    <fmt:message key="resetPassword.reset" />
                                </button>
                            </div>
                        </div>
                    </form>
                </main>
                <script src="${pageContext.request.contextPath}/resources/scripts/resetPassword.js"></script>
            </body>

            </html>