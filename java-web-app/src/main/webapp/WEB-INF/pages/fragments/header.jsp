<header class="p-3 text-bg-light navbar-static-top w-100">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="${pageContext.request.contextPath}/"
               class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
                <h1 class="mb-0">HOPS</h1>
            </a>

            <ul class="nav col-12 col-lg-auto ms-lg-4 me-lg-auto mb-2 mb-md-0 justify-content-center">
                <li><a href="${pageContext.request.contextPath}" class="nav-link px-2 text-black">
                    Home
                </a></li>
                <li><a href="${pageContext.request.contextPath}/agencies" class="nav-link px-2 text-black">
                    Agencies
                </a></li>
            </ul>

            <c:choose>
                <c:when test="${sessionScope.loggedIn == true}">
                    <div class="dropdown text-end">
                        <a href="#"
                           class="d-flex justify-content-center align-items-center link-dark text-decoration-none dropdown-toggle"
                           id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="true">
                            <p class="text-black mb-0 me-2">
                                    ${sessionScope.username}
                            </p>
                            <img src="${pageContext.request.contextPath}/resources/public/icons/user.svg" alt="mdo"
                                 width="40" height="40" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1"
                            style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 34px);"
                            data-popper-placement="bottom-start">
                            <li><a class="dropdown-item" href="#">
                                Profile
                            </a></li>
                            <li><a class="dropdown-item" href="#">
                                Rentals
                            </a></li>
                            <li><a class="dropdown-item" href="#">
                                Favorites
                            </a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li id="logout"><a class="dropdown-item" href="/logout">
                                Log out
                            </a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-end">
                        <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">
                            <button type="button" class="btn btn-outline-primary me-2">
                                Login
                            </button>
                        </a>
                        <a href="${pageContext.request.contextPath}/signup" class="ext-decoration-none">
                            <button type="button" class="btn btn-primary">
                                Sign up
                            </button>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
