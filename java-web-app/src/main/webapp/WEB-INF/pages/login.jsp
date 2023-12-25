<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<c:set var="pageTitle">
    <fmt:message key="login.title"/>
</c:set>
<jsp:include page="fragments/head.jsp">
    <jsp:param name="pageTitle" value="${pageTitle}"/>
</jsp:include>

<body>
<%@ include file="fragments/header.jsp" %>

<div class="center-login">
    <main id="main-login">
        <div class="login-image">
            <h3>
                <fmt:message key="login.placeholder"/>
            </h3>
        </div>
        <form action="${pageContext.request.contextPath}/login" method="post" class="login-color">
            <div class="login">
                <h1>
                    <fmt:message key="login.login-title"/>
                </h1>
                <div class="input-div">
                    <input type="text" name="credential" id="credential"
                           placeholder="<fmt:message key='login.credentials' />"
                           value="${not empty credential ? credential : ''}"/>
                    <img src="${pageContext.request.contextPath}/resources/public/icons/email-icon.png"
                         alt="email-icon">
                </div>
                <div class="input-div" style="margin-top: 2vh;">

                    <img src="${pageContext.request.contextPath}/resources/public/icons/password-icon.png"
                         alt="password-icon">

                    <input type="password" name="password" id="password"
                           placeholder="<fmt:message key='login.password' />"/>

                    <img src="${pageContext.request.contextPath}/resources/public/icons/eye-open.png"
                         alt="eye-icon" class="show-password">

                </div>
                <a href="${pageContext.request.contextPath}/recover">
                                    <span>
                                        <fmt:message key="login.forgot"/>
                                    </span>
                </a>
                <c:choose>
                    <c:when test="${errorLogin == 'login.invalid'}">
                        <p id="warning">
                            <fmt:message key='${errorLogin}'/>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p id="warning">${errorLogin}</p>
                    </c:otherwise>
                </c:choose>

                <c:if test="${not empty param.signup}">
                    <p id="right">
                        <fmt:message key="login.signupSuccessful"/>
                    </p>
                </c:if>

                <div class="login-btns">
                    <a href="${pageContext.request.contextPath}/signup">
                        <button type="button" class="btn-signup">
                            <fmt:message key="login.signup"/>
                        </button>
                    </a>
                    <button type="submit" class="btn-login">
                        <fmt:message key="login.login"/>
                    </button>
                </div>
            </div>
        </form>
    </main>
</div>
<script>
    const show_password = document.querySelector(".show-password");
    const password_input = document.querySelector("#password");

    show_password.addEventListener("click", () => {
        password_input.type = password_input.type === "password" ? "text" : "password";

        show_password.src = show_password.src.includes("open") ? "${pageContext.request.contextPath}/resources/public/icons/eye-close.png" : "${pageContext.request.contextPath}/resources/public/icons/eye-open.png";
    })
</script>
</body>

</html>