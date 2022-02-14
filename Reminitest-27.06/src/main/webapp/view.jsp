<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 01/29/2022
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View</title>
</head>
<body>
<center>
    <h1>All Products</h1>
    <h3><a href="/home?action=createGet">Add New Product</a></h3>
    <h3><a href="/home?action=sortIncrease">Sort Increase By Price</a></h3>
    <h3><a href="/home?action=sortDecrease">Sort Decrease By Price</a></h3>
    <h3><a href="/home?action=cart">Cart</a></h3>
</center>
<c:if test="${requestScope['products'].isEmpty()}">
    <h2 style="color: red; text-align: center">Không có sản phẩm nào</h2>
</c:if>
<c:if test="${requestScope['products'].isEmpty() == false}">
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Products</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.name}"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td><c:out value="${product.quantity}"/></td>
                    <td><c:out value="${product.description}"/></td>
                    <td>
                        <a href="/home?action=edit&id=${product.id}">Edit</a>
                        <a href="/home?action=delete&id=${product.id}">Delete</a>
                        <button><a href="home?action=addToCart&id=${product.id}">Add</a></button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:if>
</body>
</html>
