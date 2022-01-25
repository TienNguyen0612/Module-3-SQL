<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/25/2022
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/Home?action=createPost" method="post">
  <label for="id">ID :
    <input type="text" id="id" name="id">
  </label>
  <label for="name">Name :
    <input type="text" id="name" name="name">
  </label>
  <label for="age">Age :
    <input type="text" id="age" name="age">
  </label>
  <label for="address">Address :
    <input type="text" id="address" name="address">
  </label>
  <label for="avgPoint">AvgPoint :
    <input type="text" id="avgPoint" name="avgPoint">
  </label>
  <input type="submit" value="Create">
</form>
</body>
</html>
