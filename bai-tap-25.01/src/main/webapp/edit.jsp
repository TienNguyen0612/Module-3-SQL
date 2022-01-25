<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/25/2022
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/Home?action=editPost" method="post">
  <label for="id" hidden>ID :
    <input type="text" id="id" name="id" value="${student.getId()}" hidden>
  </label>
  <label for="name">Name :
    <input type="text" id="name" name="name" value="${student.getName()}">
  </label>
  <label for="age">Age :
    <input type="text" id="age" name="age" value="${student.getAge()}">
  </label>
  <label for="address">Address :
    <input type="text" id="address" name="address" value="${student.getAddress()}">
  </label>
  <label for="avgPoint">AvgPoint :
    <input type="text" id="avgPoint" name="avgPoint" value="${student.getAvgPoint()}">
  </label>
  <input type="submit" value="Edit">
</form>
</body>
</html>
