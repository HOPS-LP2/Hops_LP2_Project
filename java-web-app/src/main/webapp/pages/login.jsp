<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../styles/general.css">
    <link rel="stylesheet" href="../styles/login.css">
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
            <img src="../public/icons/home-img.png" style="margin-left: 8vw;" class="representation-img" />
            <p style="margin-left: 1vw;">Home</p>
            <div class="line"></div>
            <img src="../public/icons/car-img.png" style="margin-left: 2vw;" class="representation-img">
            <p style="margin-left: 1vw;">Cars</p>
            <div class="line"></div>
            <img src="../public/icons/agencies-img.png" style="margin-left: 2vw;" class="representation-img">
            <p style="margin-left: 1vw;">Agencies</p>
        </div>

        <div class="login-access">
            <img src="../public/icons/user-img.png" style="margin-left: 48vw;" class="representation-img" />
            <p style="margin-left: 1vw;">Login</p>
        </div>

    </header>

    <main>
        <div class="login-image">
            <h3>Colocar alguma coisa aqui dentro</h3>
        </div>
        <form action="../login" method="post" class="login-color">
            <div class="login">
                <h1 style="text-align: center; margin-top: 0">Login</h1>
                <div class="input-div">
                    <input type="email" name="email" id="email" placeholder="Email" />
                    <img src="../public/icons/email-icon.png" alt="email-icon">
                </div>
                <div class="input-div" style="margin-top: 2vh;">

                    <img src="../public/icons/password-icon.png" alt="password-icon">

                    <input type="password" name="password" id="password" placeholder="Password" />

                    <img src="../public/icons/eye-open.png" alt="eye-icon" class="show-password">

                </div>
                <a href="recoverPassword.jsp"><span>Forgot your password?</span></a>
                <c:if test="${not empty sessionScope.loginFailed}">
                    <p id="warning">${sessionScope.loginFailed}</p>
                </c:if>

                <div class="login-btns">
                    <a href="signup.jsp">
                        <button type="button" class="btn-signup">Sign Up</button>
                    </a>
                    <button type="submit" class="btn-login">Login</button>
                </div>
            </div>
        </form>
    </main>
    <script src="../scripts/login.js"></script>
</body>

</html>