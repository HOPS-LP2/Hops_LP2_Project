<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../styles/general.css">
    <link rel="stylesheet" href="../styles/home.css">
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
            <img src="../public/icons/car-img.png" style="margin-left: 2vw; width: 90%;" class="representation-img">
            <p style="margin-left: 1vw;">Cars</p>
            <div class="line"></div>
            <img src="../public/icons/agencies-img.png" style="margin-left: 2vw;" class="representation-img">
            <p style="margin-left: 1vw;">Agencies</p>
        </div>
        <c:choose>
            <c:when test="${sessionScope.loggedIn == true}">
                <div class="login-access">
                    <img src="../public/icons/user-img.png" style="margin-left: 48vw;" class="representation-img" />
                    <p style="margin-left: 1vw;">${sessionScope.firstName}</p>
                </div>
            </c:when>
            <c:otherwise>
                <a href="login.jsp">
                    <div class="login-access">
                        <img src="../public/icons/user-img.png" style="margin-left: 48vw;" class="representation-img" />
                        <p style="margin-left: 1vw;">Login</p>
                    </div>
                </a>
            </c:otherwise>
        </c:choose>

    </header>

    <main>
        <section class="search">
            <form>
                <div style="margin-bottom: 1vh;">
                    <h3 style="font-weight: 500;">Check available vehicles</h3>
                </div>
                <div class="div-special">
                    <div>
                        <label for="location">Location:</label>
                        <input type="text" name="location" id="location" style="width: 15vw;"
                            placeholder="Enter your zip code..." />
                    </div>
                    <div style="margin-left: 2vw;">
                        <label for="date">Date:</label>
                        <input type="date" name="date" id="date" style="width: 6vw;" />
                    </div>
                    <div style=" margin-left: 2vw;">
                        <label for="time">Time:</label>
                        <input type="time" name="time" id="time" style="width: 6vw;" />
                    </div>
                    <div style="margin-left: 2vw;">
                        <button type="submit" class="btn-search">Search <img src="../public/icons/btn-img.png"
                                class="btn-img" /></button>
                    </div>
                </div>
            </form>
        </section>

        <section>
            <div>
                <h1 style="margin: 0 0 5vh 20vw;">Popular right now</h1>
            </div>
            <div class="touch-slider">
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/fiat.png" /></div>
                    <h1>FIAT Mobi</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/nissan.png" /></div>
                    <h1>NISSAN Versa Sense</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div style="margin-right: 2rem;">
                    <div class="slide"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
            </div>
        </section>
    </main>

    <script src="../scripts/home.js"></script>
</body>

</html>