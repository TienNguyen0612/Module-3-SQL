<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/26/2022
  Time: 8:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        img {
            width: 90px;
            height: 120px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Bordered Table</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Birth</th>
            <th>Address</th>
            <td>Image</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customers}" var="cus">
            <tr>
                <td>${cus.getName()}</td>
                <td>${cus.getBirthday()}</td>
                <td>${cus.getAddress()}</td>
                <td><img src="${cus.getImage()}" alt=""></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
