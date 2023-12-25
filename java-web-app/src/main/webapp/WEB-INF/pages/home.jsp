<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<c:set var="pageTitle">
    <fmt:message key="home.title"/>
</c:set>
<jsp:include page="fragments/head.jsp">
    <jsp:param name="pageTitle" value="${pageTitle}"/>
    <jsp:param name="css" value="home"/>
</jsp:include>

<body>
<%@ include file="fragments/header.jsp" %>

<main>
    <section class="search">
        <form>
            <div class="available">
                <h3>
                    <fmt:message key="home.check-availability"/>
                </h3>
            </div>
            <label for="location" id="label-location">Escolha uma agência:</label>
            <div class="search-items">
                <div style="position: relative;" class="search-input">
                    <input type="text" id="location" name="location" class="form-control"
                           placeholder="<fmt:message key='home.enter-adress' />" autocomplete="off"/>
                    <div id="agenciesList"></div>
                </div>
                <button type="submit" class="btn-search">Search<img
                        src="${pageContext.request.contextPath}/resources/public/icons/btn-img.png" class="btn-img"/>
                </button>
            </div>
        </form>
    </section>

    <section>
        <div class="slider-text">
            <h1>
                <fmt:message key="home.popular"/>
            </h1>
        </div>
        <div class="touch-slider">
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/fiat.png"/>
                </div>
                <h1>FIAT Mobi</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/nissan.png"/>
                </div>
                <h1>NISSAN Versa Sense</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div>
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
            <div class="last-slide">
                <div class="slide"><img
                        src="${pageContext.request.contextPath}/resources/public/cars/bmw.png"/>
                </div>
                <h1>BMW X6</h1>
            </div>
        </div>
    </section>
</main>
<script src="${pageContext.request.contextPath}/resources/scripts/home.js"></script>
<script src="${pageContext.request.contextPath}/resources/scripts/getAgencies.js"></script>
</body>

</html>