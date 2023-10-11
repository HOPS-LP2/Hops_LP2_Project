<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/general.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/signup.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  </head>

  <body>
    <header>
      <div>
        <h1 style="margin-left: 3vw; font-size: 25px;">HOPS</h1>
      </div>
      <div class="quick-access">
        <img src="${pageContext.request.contextPath}/public/icons/home-img.png" style="margin-left: 8vw;"
          class="representation-img" />
        <p style="margin-left: 1vw;">Home</p>
        <div class="line"></div>
        <img src="${pageContext.request.contextPath}/public/icons/car-img.png" style="margin-left: 2vw;"
          class="representation-img">
        <p style="margin-left: 1vw;">Cars</p>
        <div class="line"></div>
        <img src="${pageContext.request.contextPath}/public/icons/agencies-img.png" style="margin-left: 2vw;"
          class="representation-img">
        <p style="margin-left: 1vw;">Agencies</p>
      </div>
      <a href="${pageContext.request.contextPath}/pages/login.jsp">
        <div class="login-access">
          <img src="${pageContext.request.contextPath}/public/icons/user-img.png" style="margin-left: 48vw;"
            class="representation-img" />
          <p style="margin-left: 1vw;">Login</p>
        </div>
      </a>
    </header>

    <main>
      <div class="signup">
        <h2>Sign Up</h2>

        <form action="${pageContext.request.contextPath}/signup" method="post" id="signup-form">
          <div class="input-field small">
            <label for="first-name">First name:</label>
            <input type="text" name="first-name" id="first-name" value="${not empty param['first-name'] ? param['first-name'] : ''}">
          </div>

          <div class="input-field small">
            <label for="last-name">Last name:</label>
            <input type="text" name="last-name" id="last-name" value="${not empty param['last-name'] ? param['last-name'] : ''}">
          </div>

          <div class="input-field large">
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" value="${not empty param['email'] ? param['email'] : ''}">
          </div>

          <div class="input-field large">
            <label for="ssn">Social Security Number (SSN):</label>
            <input type="text" name="ssn" id="ssn" value="${not empty param['ssn'] ? param['ssn'] : ''}">
          </div>

          <div class="input-field large">
            <label for="phone-number">Phone Number:</label>
            <input type="tel" name="phone-number" id="phone-number" value="${not empty param['phone-number'] ? param['phone-number'] : ''}" />
          </div>

          <div class="input-field small">
            <label for="password">Create password:</label>
            <input type="password" name="password" id="password">

            <div class="password-req">
              <p>Password must contain:<br>
                at least 8 characters; <br>
                at least one number; <br>
                at least one lowercase letter; <br>
                at least one uppercase letter;
              </p>
            </div>
          </div>
          <div class="input-field small">
            <label for="confirm-password">Confirm password:</label>
            <input type="password" name="confirm-password" id="confirm-password">
          </div>

        </form>
        <c:if test="${not empty sessionScope.message}">
          <p id="warning">${sessionScope.message}</p>
        </c:if>
        <p id="warning"></p>
        <button type="submit" class="large" form="signup-form">Confirm</button>

      </div>

    </main>

    <script src="${pageContext.request.contextPath}/scripts/signup.js"></script>
  </body>

  </html>