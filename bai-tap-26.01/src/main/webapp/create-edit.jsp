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
    <title>Create-Edit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:url value="/cities" var="myUrl">
    <%--@elvariable id="city" type="controller"--%>
    <c:if test="${city != null}">
        <c:param name="action" value="editPost"/>
    </c:if>
    <c:if test="${city == null}">
        <c:param name="action" value="createPost"/>
    </c:if>
</c:url>
<form action="${myUrl}" method="post">
    <label>ID :
        <input <%--@elvariable id="city" type="controller"--%>
        <c:if test="${city != null}">value="${city.getId()}"</c:if> type="text" name="id">
    </label>
    <label>Name :
        <input <c:if test="${city != null}">value="${city.getName()}"</c:if> type="text" name="name">
    </label>
    <label>Area :
        <input <c:if test="${city != null}">value="${city.getArea()}"</c:if> type="text" name="area">
    </label>
    <label>Population :
        <input <c:if test="${city != null}">value="${city.getPopulation()}"</c:if> type="text" name="population">
    </label>
    <label>GDP :
        <input <c:if test="${city != null}">value="${city.getGDP()}"</c:if> type="text" name="GDP">
    </label>
    <label>Country :
        <select name="country">
            <c:forEach items="${countries}" var="country">
                <option value="${country}">${country}</option>
            </c:forEach>
        </select>
    </label>
    <br>
    <br>
    <input type="submit" class="btn btn-outline-danger"
           <c:if test="${city != null}">value="Edit"</c:if>
           <c:if test="${city == null}">value="Create"</c:if>>
</form>
</body>
</html>
