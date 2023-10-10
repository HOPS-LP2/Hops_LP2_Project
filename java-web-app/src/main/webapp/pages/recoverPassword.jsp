<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recover_Password</title>
    <link rel="stylesheet" href="../styles/recoverPassword.css">
    <link rel="stylesheet" href="../styles/general.css">
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
        <a href="login.html">
            <div class="login-access">
                <img src="../public/icons/user-img.png" style="margin-left: 48vw;" class="representation-img" />
                <p style="margin-left: 1vw;">Login</p>
            </div>
        </a>
    </header>

    <main>
        <form action="../recover" method="post" class="recover-color">
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