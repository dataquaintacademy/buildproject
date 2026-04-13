<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - InstaShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container narrow">
    <header>
        <h1>Your Cart</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/home">🏠 Continue Shopping</a>
    </header>

    <c:choose>
        <c:when test="${empty cartItems}">
            <div class="empty-message">
                <h2 style="color: #1f42a8; margin-bottom: 1rem;">Your cart is empty</h2>
                <p>Start adding products to your cart and shop with us!</p>
                <a class="button-link" href="${pageContext.request.contextPath}/home" style="margin-top: 1rem;">Explore Products</a>
            </div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartItems}" var="item">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td>${item.lineTotal} dollars</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <p class="total">💰 Total: ${cartTotal} dollars</p>
            <a class="button-link" href="${pageContext.request.contextPath}/checkout">Proceed to Checkout →</a>
        </c:otherwise>
    </c:choose>
</div>
<footer>
    <p>&copy; 2026 InstaShop. All rights reserved. | Safe & Secure Checkout</p>
</footer>
</body>
</html>
