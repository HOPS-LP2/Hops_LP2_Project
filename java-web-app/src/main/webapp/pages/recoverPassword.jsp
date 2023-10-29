<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recover Password &VerticalLine; HOPS</title>
    <link rel="icon" href="${pageContext.request.contextPath}/favicon.ico" />
    <link rel="stylesheet" href="../styles/recoverPassword.css">
    <link rel="stylesheet" href="../styles/general.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
    <header>
        <div>
            <h1 class="logo">HOPS</h1>
        </div>
        <div class="quick-access">

            <a href="${pageContext.request.contextPath}/pages/home.jsp">
                <img src="${pageContext.request.contextPath}/public/icons/home-img.png" class="representation-img" />
            </a>
            <a href="${pageContext.request.contextPath}/pages/home.jsp">
                <p class="text-header">Home</p>
            </a>

            <div class="line"></div>

            <a href="${pageContext.request.contextPath}/pages/catalog.jsp">
                <img src="${pageContext.request.contextPath}/public/icons/car-img.png" class="representation-img">
            </a>
            <a href="${pageContext.request.contextPath}/pages/catalog.jsp">
                <p class="text-header">Cars</p>
            </a>

            <div class="line"></div>

            <a href="${pageContext.request.contextPath}/pages/agencies.jsp">
                <img src="${pageContext.request.contextPath}/public/icons/agencies-img.png" class="representation-img">
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

    <main>
        <form action="${pageContext.request.contextPath}/recover" method="post" class="recover-color">
            <div class="recover">
                <h1 style="text-align: center; margin-top: 0">Forgot Password</h1>
                <div class="input-div">
                    <input type="email" name="email" id="email" placeholder="Email" />
                    <img src="../public/icons/email-icon.png" alt="email-icon">
                </div>

                <c:if test="${not empty sessionScope.emailFound}">
                    <p id="right">${sessionScope.emailFound}</p>
                </c:if>
                <c:if test="${not empty sessionScope.emailNotFound}">
                    <p id="wrong">${sessionScope.emailNotFound}</p>
                </c:if>

                <div class="recover-btn">
                    <button type="submit" class="btn-recover">Next</button>
                </div>
            </div>
        </form>
    </main>
    <script src="../scripts/recoverPassword.js"></script>
</body>

</html>