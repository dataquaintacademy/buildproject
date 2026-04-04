<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container narrow">
    <header>
        <h1>Checkout</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/cart">Back to Cart</a>
    </header>

    <c:choose>
        <c:when test="${empty cartItems}">
            <p>Your cart is empty. Add products before checkout.</p>
            <a class="button-link" href="${pageContext.request.contextPath}/home">Go to Home</a>
        </c:when>
        <c:otherwise>
            <form method="post" action="${pageContext.request.contextPath}/checkout" class="checkout-form">
                <label>
                    Full Name
                    <input type="text" name="fullName" required>
                </label>
                <label>
                    Email
                    <input type="email" name="email" required>
                </label>
                <label>
                    Shipping Address
                    <textarea name="address" rows="4" required></textarea>
                </label>

                <p class="total">Order Total: $${cartTotal}</p>
                <button type="submit">Place Order</button>
            </form>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
