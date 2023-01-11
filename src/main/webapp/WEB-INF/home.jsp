<%--
  Created by IntelliJ IDEA.
  User: alanlytton
  Date: 1/10/23
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <title>Title</title>
</head>
<body>
<h1>Welcome <c:out value="${userName}"/></h1>
<p><a href="/logout" class="btn btn-primary">Logout</a></p>

<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
