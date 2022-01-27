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
    <title>Create - Edit</title>
</head>
<body>
<c:url value="/products" var="myUrl">
    <%--@elvariable id="product" type="controller"--%>
    <c:if test="${product != null}">
        <c:param name="action" value="editPost"/>
    </c:if>
    <c:if test="${product == null}">
        <c:param name="action" value="createPost"/>
    </c:if>
</c:url>
<form action="${myUrl}" method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td><input
                <%--@elvariable id="product" type="controller"--%>
                        <c:if test="${product != null}">value="${product.getId()}"</c:if> type="text" name="id"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input <c:if test="${product != null}">value="${product.getName()}"</c:if> type="text" name="name"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input <c:if test="${product != null}">value="${product.getPrice()}"</c:if> type="text" name="price"></td>
            </tr>
            <tr>
                <td>Quantity: </td>
                <td><input <c:if test="${product != null}">value="${product.getQuantity()}"</c:if> type="text" name="quantity"></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input <c:if test="${product != null}">value="${product.getDescription()}"</c:if> type="text"  name="description"></td>

            </tr>
            <input type="submit" class="btn btn-outline-danger"
                   <c:if test="${product != null}">value="Edit"</c:if>
                   <c:if test="${product == null}">value="Create"</c:if>>
        </table>
    </fieldset>
</form>
</body>
</html>
