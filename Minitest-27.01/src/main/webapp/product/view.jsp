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
    <title>All Products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<c:if test="${requestScope['listProduct'].isEmpty()}">
    <h2 style="color: red">Không có sản phẩm nào</h2>
</c:if>
<br>
<button type="button" class="btn btn-outline-primary">
    <a href="${pageContext.request.contextPath}/products?action=createGet">Create New Product</a>
</button>
<button type="button" class="btn btn-outline-primary">
    <a href="${pageContext.request.contextPath}/products?action=sortIncrease">Sort Increase</a>
</button>
<button type="button" class="btn btn-outline-primary">
    <a href="${pageContext.request.contextPath}/products?action=sortDecrease">Sort Decrease</a>
</button>
<br>
<c:if test="${requestScope['listProduct'].isEmpty() == false}">
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listProduct}" var="product">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getQuantity()}</td>
                    <td>${product.getDescription()}</td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <a href="${pageContext.request.contextPath}/products?action=editGet&id=${product.getId()}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.getId()}">Delete</a>
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
