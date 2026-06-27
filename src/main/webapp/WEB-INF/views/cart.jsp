<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Premium Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container narrow">
    <header>
        <h1>Shopping Cart</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/home">Continue Shopping</a>
    </header>

    <c:choose>
        <c:when test="${empty cartItems}">
            <div class="empty-message">
                <h2 style="color: #1f3a5f; margin-bottom: 1rem;">Your cart is empty</h2>
                <p>Start adding products to your cart and complete your purchase.</p>
                <a class="button-link" href="${pageContext.request.contextPath}/home" style="margin-top: 1rem;">Continue Shopping</a>
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
                        <td>$ ${item.lineTotal}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <p class="total">Order Total: $ ${cartTotal}</p>
            <a class="button-link" href="${pageContext.request.contextPath}/checkout">Proceed to Checkout</a>
        </c:otherwise>
    </c:choose>
</div>
<footer>
    <p>&copy; 2026 Premium Shop. All rights reserved. | Fast Delivery | Secure Payment</p>
</footer>
</body>
</html>
