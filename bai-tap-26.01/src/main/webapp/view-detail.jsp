<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/26/2022
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View-Detail</title>
    <style>
        p {
            color: brown;
            font-family: Arial, serif;
        }
    </style>
</head>
<body>
<h1>City</h1>
<p>Id: ${city.getId()}</p>
<p>Name: ${city.getName()}</p>
<p>Area: ${city.getArea()}</p>
<p>Population: ${city.getPopulation()}</p>
<p>GDP: ${city.getGDP()}</p>
<p>Country: ${city.getCountry()}</p>
</body>
</html>
