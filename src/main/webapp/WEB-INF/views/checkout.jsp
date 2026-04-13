<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Checkout - InstaShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container narrow">
    <header>
        <h1>Secure Checkout</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/cart">🔙 Back to Cart</a>
    </header>

    <c:choose>
        <c:when test="${empty cartItems}">
            <div class="empty-message">
                <h2 style="color: #1f42a8; margin-bottom: 1rem;">Your cart is empty</h2>
                <p>Add products to your cart before proceeding to checkout.</p>
                <a class="button-link" href="${pageContext.request.contextPath}/home" style="margin-top: 1rem;">Start Shopping</a>
            </div>
        </c:when>
        <c:otherwise>
            <form method="post" action="${pageContext.request.contextPath}/checkout" class="checkout-form">
                <label>
                    👤 Full Name
                    <input type="text" name="fullName" placeholder="Enter your full name" required>
                </label>
                <label>
                    📧 Email Address
                    <input type="email" name="email" placeholder="Enter your email" required>
                </label>
                <label>
                    📍 Shipping Address
                    <textarea name="address" rows="4" placeholder="Enter your complete address" required></textarea>
                </label>

                <p class="total">💰 Order Total: $ ${cartTotal}</p>
                <button type="submit">✓ Place Order</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>
<footer>
    <p>&copy; 2026 InstaShop. All rights reserved. | 100% Secure Payment</p>
</footer>
</body>
</html>
