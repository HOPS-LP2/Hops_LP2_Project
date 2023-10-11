<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset_Password</title>
    <link rel="stylesheet" href="../styles/resetPassword.css">
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
        <form action="../reset" method="post" class="reset-color" id="reset-form">
            <div class="reset">
                <h1 style="text-align: center; margin-top: 0">Reset Password</h1>
                <div class="input-div">

                    <img src="../public/icons/password-icon.png" alt="password-icon">

                    <input type="password" name="password" id="password" placeholder="New Password" />

                    <img src="../public/icons/eye-open.png" alt="eye-icon" class="show-password">

                </div>
                <div class="input-div" style="margin-top: 2vh;">

                    <img src="../public/icons/password-icon.png" alt="password-icon">

                    <input type="password" name="confirm-password" id="confirm-password"
                        placeholder="Confirm Password" />

                    <img src="../public/icons/eye-open.png" alt="eye-icon" class="show-confirm-password">

                </div>
                <p id="wrong"></p>
                <div class="reset-btn">
                    <button type="submit" class="btn-reset">Reset</button>
                </div>
            </div>
        </form>
    </main>
    <script src="../scripts/resetPassword.js"></script>
</body>

</html>