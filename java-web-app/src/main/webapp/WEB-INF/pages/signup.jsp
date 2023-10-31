<%@ page language="java" contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
          <fmt:message key="signup.title" /> &VerticalLine; HOPS
        </title>
        <link rel="icon" href="${pageContext.request.contextPath}/favicon.ico" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/general.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/signup.css">

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
          <div class="signup">
            <h2>
              <fmt:message key="signup.signup" />
            </h2>

            <form action="${pageContext.request.contextPath}/signup" method="post" id="signup-form">
              <div class="input-field small">
                <label for="first-name">
                  <fmt:message key="signup.first-name" />
                </label>
                <input type="text" name="first-name" id="first-name"
                  value="${not empty param['first-name'] ? param['first-name'] : ''}">
              </div>

              <div class="input-field small">
                <label for="last-name">
                  <fmt:message key="signup.last-name" />
                </label>
                <input type="text" name="last-name" id="last-name"
                  value="${not empty param['last-name'] ? param['last-name'] : ''}">
              </div>

              <div class="input-field large">
                <label for="email">
                  <fmt:message key="signup.email" />
                </label>
                <input type="text" name="email" id="email" value="${not empty param['email'] ? param['email'] : ''}">
              </div>

              <div class="input-field large">
                <label for="ssn">
                  <fmt:message key="signup.SSN" />
                </label>
                <input type="text" name="ssn" id="ssn" value="${not empty param['ssn'] ? param['ssn'] : ''}">
              </div>

              <div class="input-field large">
                <label for="phone-number">
                  <fmt:message key="signup.phone-number" />
                </label>
                <input type="tel" name="phone-number" id="phone-number"
                  value="${not empty param['phone-number'] ? param['phone-number'] : ''}" />
              </div>

              <div class="input-field small">
                <label for="password">
                  <fmt:message key="signup.create-password" />
                </label>
                <input type="password" name="password" id="password">

                <div class="password-req">
                  <p>
                    <fmt:message key="signup.password-requirements" />
                  </p>
                </div>
              </div>
              <div class="input-field small">
                <label for="confirm-password">
                  <fmt:message key="signup.confirm-password" />
                </label>
                <input type="password" name="confirm-password" id="confirm-password">
              </div>

            </form>
            <c:if test="${not empty sessionScope.message}">
              <p id="warning">${sessionScope.message}</p>
            </c:if>
            <p id="warning"></p>
            <button type="submit" class="large" form="signup-form">
              <fmt:message key="signup.confirm" />
            </button>

          </div>

        </main>

        <script src="${pageContext.request.contextPath}/scripts/signup.js"></script>
      </body>

      </html>