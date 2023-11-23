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

                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/home.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/contact.css">
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
                
                <div class="wrap-contact100" style="display: block;">
                    <form class="contact100-form validate-form" action="${pageContext.request.contextPath}/contactUs" method="post">
                        <span class="contact100-form-title">Contact Us</span>
                        <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
                            <span class="label-input100">Your Name</span>
                            <input class="input100" type="text" name="name" id="name" placeholder="Enter your name">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                            <span class="label-input100">Email</span>
                            <input class="input100" type="text" name="email" id="email" placeholder="Enter your email addess">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Message is required">
                            <span class="label-input100">Message</span>
                            <textarea class="input100" name="message" id="message" placeholder="Your message here..."></textarea>
                            <span class="focus-input100"></span>
                            <c:if test="${not empty formError}">
                                    <p class="warning">
                                        ${formError}
                                    </p>
                            </c:if>
                            <c:if test="${not empty messageSent}">
                                    <p>
                                        <fmt:message key="${messageSent}" />
                                    </p>
                            </c:if>
                        </div>    
                        <div class="container-contact100-form-btn">
                            <button class="contact100-form-btn">
                                <span>
                                    Submit
                                    <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                                </span>
                            </button>
                        </div>
                    </form>
                </div>

                <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            </body>

            </html>