<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container narrow">
    <header>
        <h1>Your Cart</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/home">Continue Shopping</a>
    </header>

    <c:choose>
        <c:when test="${empty cartItems}">
            <p>Your cart is empty.</p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Line Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartItems}" var="item">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td>$${item.lineTotal}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <p class="total">Total: $${cartTotal}</p>
            <a class="button-link" href="${pageContext.request.contextPath}/checkout">Proceed to Checkout</a>
        </c:otherwise>
    </c:choose>
</div>
<footer>
    <p>&copy; 2026 Thrift Shopping. All rights reserved.</p>
</footer>
</body>
</html>
