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
    <jsp:param name="css" value="contact"/>
</jsp:include>

<body>
<%@ include file="fragments/header.jsp" %>


<div class="wrap-contact100" style="display: block;">
    <form class="contact100-form validate-form" action="${pageContext.request.contextPath}/contactUs" method="post">
        <span class="contact100-form-title">Contact Us</span>
        <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Name is required">
            <span class="label-input100">Your Name</span>
            <input class="input100" type="text" name="name" id="name" placeholder="Enter your name">
            <span class="focus-input100"></span>
        </div>
        <div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
            <span class="label-input100">Email</span>
            <input class="input100" type="text" name="email" id="email" placeholder="Enter your email addess">
            <span class="focus-input100"></span>
        </div>
        <div class="wrap-input100 validate-input" data-validate="Message is required">
            <span class="label-input100">Message</span>
            <textarea class="input100" name="message" id="message" placeholder="Your message here..."></textarea>
            <span class="focus-input100"></span>
            <c:if test="${not empty formError}">
                <p class="warning">
                        ${formError}
                </p>
            </c:if>
            <c:if test="${not empty messageSent}">
                <p>
                    <fmt:message key="${messageSent}"/>
                </p>
            </c:if>
        </div>
        <div class="container-contact100-form-btn">
            <button class="contact100-form-btn">
                                <span>
                                    Submit
                                    <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                                </span>
            </button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>