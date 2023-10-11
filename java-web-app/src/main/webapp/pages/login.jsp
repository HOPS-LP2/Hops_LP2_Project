<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/general.css">
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

                    <a href="${pageContext.request.contextPath}/pages/home.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/home-img.png"
                            class="representation-img" />
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/home.jsp">
                        <p class="text-header">Home</p>
                    </a>

                    <div class="line"></div>

                    <a href="${pageContext.request.contextPath}/pages/catalog.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/car-img.png"
                            class="representation-img">
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/catalog.jsp">
                        <p class="text-header">Cars</p>
                    </a>

                    <div class="line"></div>

                    <a href="${pageContext.request.contextPath}/pages/agencies.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/agencies-img.png"
                            class="representation-img">
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/agencies.jsp">
                        <p class="text-header">Agencies</p>
                    </a>
                </div>

                <div class="login-access">
                    <a href="${pageContext.request.contextPath}/pages/login.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/user-img.png"
                            class="representation-img" /></a>
                    <a href="${pageContext.request.contextPath}/pages/login.jsp">
                        <p class="text-header">Login</p>
                    </a>
                </div>

            </header>

            <main id="main-login">
                <div class="login-image">
                    <h3>Colocar alguma coisa aqui dentro</h3>
                </div>
                <form action="${pageContext.request.contextPath}/login" method="post" class="login-color">
                    <div class="login">
                        <h1 style="text-align: center; margin-top: 0">Login</h1>
                        <div class="input-div">
                            <input type="email" name="email" id="email" placeholder="Email"
                                value="${not empty param.email ? param.email : ''}" />
                            <img src="${pageContext.request.contextPath}/public/icons/email-icon.png" alt="email-icon">
                        </div>
                        <div class="input-div" style="margin-top: 2vh;">

                            <img src="${pageContext.request.contextPath}/public/icons/password-icon.png"
                                alt="password-icon">

                            <input type="password" name="password" id="password" placeholder="Password" />

                            <img src="${pageContext.request.contextPath}/public/icons/eye-open.png" alt="eye-icon"
                                class="show-password">

                        </div>
                        <a href="${pageContext.request.contextPath}/pages/recoverPassword.jsp"><span>Forgot your
                                password?</span></a>
                        <c:if test="${not empty sessionScope.passwordReset}">
                            <p id="right">${sessionScope.passwordReset}</p>
                        </c:if>
                        <c:if test="${not empty sessionScope.loginFailed}">
                            <p id="warning">${sessionScope.loginFailed}</p>
                        </c:if>

                        <div class="login-btns">
                            <a href="${pageContext.request.contextPath}/pages/signup.jsp">
                                <button type="button" class="btn-signup">Sign Up</button>
                            </a>
                            <button type="submit" class="btn-login">Login</button>
                        </div>
                    </div>
                </form>
            </main>
            <script>
                const show_password = document.querySelector(".show-password");
                const password_input = document.querySelector("#password");

                show_password.addEventListener("click", () => {
                    password_input.type = password_input.type === "password" ? "text" : "password";

                    show_password.src = show_password.src.includes("open") ? "${pageContext.request.contextPath}/public/icons/eye-close.png" : "${pageContext.request.contextPath}/public/icons/eye-open.png";
                })
            </script>
        </body>

        </html>