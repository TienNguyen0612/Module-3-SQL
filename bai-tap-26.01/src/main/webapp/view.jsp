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
    <title>View</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>All City</h1>
<c:if test="${requestScope['listCity'].isEmpty()}">
    <h2 style="color: red">Không có thành phố nào</h2>
</c:if>
<br>
<button type="button" class="btn btn-outline-primary">
    <a href="${pageContext.request.contextPath}/cities?action=createGet">Create New City</a>
</button>
<br>
<c:if test="${requestScope['listCity'].isEmpty() == false}">
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Popular</th>
                <th>Area</th>
                <th>GDP</th>
                <th>Country</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCity}" var="city">
                <tr>
                    <td>${city.getId()}</td>
                    <td><a id="name" style="text-decoration: none" href="${pageContext.request.contextPath}/cities?action=detail&id=${city.getId()}">${city.getName()}</a></td>
                    <td>${city.getArea()}</td>
                    <td <c:if test="${city.getPopulation() > 10000000}"> style="color: red" </c:if>>${city.getPopulation()}</td>
                    <td <c:if test="${city.getGDP() < 11000000}"> style="color: red" </c:if>>${city.getGDP()}</td>
                    <td>${city.getCountry()}</td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <a href="${pageContext.request.contextPath}/cities?action=editGet&id=${city.getId()}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <a href="${pageContext.request.contextPath}/cities?action=delete&id=${city.getId()}">Delete</a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
</body>
</html>
