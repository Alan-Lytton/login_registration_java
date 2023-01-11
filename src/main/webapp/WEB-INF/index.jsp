<%--
  Created by IntelliJ IDEA.
  User: alanlytton
  Date: 1/10/23
  Time: 8:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <title>Login/Registration</title>
</head>
<body>
<div class="container d-flex">
    <div class="container d-flex flex-column">
        <h2>Registration</h2>
        <form:form action="/register" modelAttribute="newUser" method="post">
            <div class="container d-flex flex-column">
                <p class="text-danger"><form:errors path="userName"/></p>
                <p>
                    <form:label path="userName">User Name: </form:label>
                    <form:input path="userName"/>
                </p>
            </div>
            <div class="container d-flex flex-column">
                <p class="text-danger"><form:errors path="email"/></p>
                <p>
                    <form:label path="email">Email: </form:label>
                    <form:input path="email"/>
                </p>
            </div>
            <div class="container d-flex flex-column">
                <p class="text-danger"><form:errors path="password"/></p>
                <p>
                    <form:label path="password">Password: </form:label>
                    <form:input type="password" path="password"/>
                </p>
            </div>
            <div class="container d-flex flex-column">
                <p class="text-danger"><form:errors path="confirm"/></p>
                <p>
                    <form:label path="confirm">Confirm PW: </form:label>
                    <form:input type="password" path="confirm"/>
                </p>
            </div>
            <input type="submit" value="Submit" class="btn btn-primary align-self-start">
        </form:form>

    </div>
    <div class="container d-flex flex-column">
        <h2>Login</h2>
        <form:form action="/login" modelAttribute="newLogin" method="post">
            <div class="container d-flex flex-column">
                <p class="text-danger"><form:errors path="email"/></p>
                <p>
                    <form:label path="email">Email: </form:label>
                    <form:input path="email"/>
                </p>
            </div>
            <div class="container d-flex flex-column">
                <p class="text-danger"><form:errors path="password"/></p>
                <p>
                    <form:label path="password">Password: </form:label>
                    <form:input type="password" path="password"/>
                </p>
            </div>
            <input type="submit" value="Submit" class="btn btn-primary align-self-start">
        </form:form>
    </div>

</div>

<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
