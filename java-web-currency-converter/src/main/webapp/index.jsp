<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/24/2022
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Currency Converter$</title>
    <style>
      .form {
        line-height: 2;
      }
    </style>
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form class="form" method="post" action="/converter">
    <label>Rate: </label><br/>
    <label>
      <input type="text" name="rate" placeholder="RATE" value="22000"/>
    </label><br/>
    <label>USD: </label><br/>
    <label>
      <input type="text" name="usd" placeholder="USD" value="0"/>
    </label><br/>
    <br/>
    <input type = "submit" id = "submit" value = "Converter"/>
  </form>
  </body>
</html>
