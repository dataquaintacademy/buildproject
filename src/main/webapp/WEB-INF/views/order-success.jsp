<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed - Premium Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container narrow">
    <div class="success-box">
        <h2>Order Placed Successfully!</h2>
        <p style="font-size: 1rem; margin: 1rem 0;">Thank you for shopping with Premium Shop!</p>
        <p style="font-size: 0.95rem; color: #666666;">Your order has been confirmed and will be delivered soon.</p>
        <p style="font-size: 0.9rem; color: #2b6dbd; margin-top: 1.5rem; font-weight: 600;">
            A confirmation email has been sent to your registered email address.
        </p>
        <a class="button-link" href="${pageContext.request.contextPath}/home" style="margin-top: 1.5rem;">Back to Shopping</a>
    </div>
</div>
<footer>
    <p>&copy; 2026 Premium Shop. All rights reserved. | Track Your Orders | Customer Support</p>
</footer>
</body>
</html>
