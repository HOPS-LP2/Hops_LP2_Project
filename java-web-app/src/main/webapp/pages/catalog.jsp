<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
                rel="stylesheet">
        </head>

        <body>
            <header>
                <div>
                    <h1 class="logo">HOPS</h1>
                </div>
                <div class="quick-access">
                    <a href="${pageContext.request.contextPath}/pages/home.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/home-img.png"
                            class="representation-img" />
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/home.jsp">
                        <p class="text-header">Home</p>
                    </a>

                    <div class="line"></div>

                    <a href="${pageContext.request.contextPath}/pages/catalog.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/car-img.png"
                            class="representation-img">
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/catalog.jsp">
                        <p class="text-header">Cars</p>
                    </a>

                    <div class="line"></div>

                    <a href="${pageContext.request.contextPath}/pages/agencies.jsp">
                        <img src="${pageContext.request.contextPath}/public/icons/agencies-img.png"
                            class="representation-img">
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/agencies.jsp">
                        <p class="text-header">Agencies</p>
                    </a>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.loggedIn == true}">
                        <div class="login-access">
                            <a href="${pageContext.request.contextPath}/pages/login.jsp">
                                <img src="${pageContext.request.contextPath}/public/icons/user-img.png"
                                    class="representation-img" />
                            </a>
                            <a href="${pageContext.request.contextPath}/pages/login.jsp">
                                <p class="text-header">${sessionScope.userName}</p>
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="login.jsp">
                            <div class="login-access">
                                <a href="${pageContext.request.contextPath}/pages/login.jsp">
                                    <img src="${pageContext.request.contextPath}/public/icons/user-img.png"
                                        class="representation-img" />
                                </a>
                                <a href="${pageContext.request.contextPath}/pages/login.jsp">
                                    <p class="text-header">Login</p>
                                </a>
                            </div>
                        </a>
                    </c:otherwise>
                </c:choose>

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