<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/27/2022
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product Detail</title>
    <style>
        p {
            color: brown;
            font-family: Arial, serif;
        }
    </style>
</head>
<body>
<h1>Product Detail</h1>
<p>Id: ${product.getId()}</p>
<p>Name: ${product.getName()}</p>
<p>Price: ${product.getPrice()}</p>
<p>Quantity: ${product.getQuantity()}</p>
<p>Description: ${product.getDescription()}</p>
</body>
</html>
