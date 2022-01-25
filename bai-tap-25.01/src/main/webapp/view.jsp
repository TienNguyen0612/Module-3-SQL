<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/25/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Student Manager</title>
    <style>
        table {
            width: 700px;
            border: solid 1px black;
        }
    </style>
</head>
<body>
<h1>All Students</h1>
<c:if test="studentList.isEmpty()">
    <p style="color: red">Không có sinh viên nào</p>
</c:if>
<button><a href="/Home?action=createGet">Create new student</a></button>
<button><a href="/Home?action=sort">Sort Increase</a></button>
<button><a href="/Home?action=great">Display Great Student</a></button>
<br>
<br>
<form action="/Home?action=search" method="post">
    <label>
        <input type="text" name="search-name">
    </label>
    <button type="submit">Search</button>
</form>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Age</td>
        <td>Address</td>
        <td>AvgPoint</td>
        <td colspan="2">Action</td>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getAge()}</td>
            <td>${student.getAddress()}</td>
            <td>${student.getAvgPoint()}</td>
            <td><a href="/Home?action=delete&id=${student.getId()}">Delete</a></td>
            <td><a href="/Home?action=editGet&id=${student.getId()}">Edit</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
