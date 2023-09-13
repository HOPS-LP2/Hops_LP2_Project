<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog</title>
    <link rel="stylesheet" href="../styles/general.css">
    <link rel="stylesheet" href="../styles/catalog.css">
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
        <header>
            <h1 style="font-size: 30px; margin: 0;">Vehicles</h1>
            <div class="search">
                <div class="search-box-wrapper">
                    <input type="text" class="search-input" placeholder="Search">
                    <img class="search-icon" src="../public/icons/btn-img.png">
                </div>

                <select name="sort" id="sort" class="search-select">
                    <option value="mais-relevante">Mais Relevantes</option>
                    <option value="menor-preco">Maior Preço</option>
                    <option value="maior-preco">Menor Preço</option>
                </select>
            </div>
        </header>
        <section class="catalog">
            <div class="filter"></div>
            <div class="cars">
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
                <div>
                    <div class="product"><img src="../public/cars/bmw.png" /></div>
                    <h1>BMW X6</h1>
                </div>
            </div>
        </section>
    </main>
</body>

</html>