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
                <h2>Your cart is empty</h2>
                <p>Add a few favorites and come back here for a speedy checkout.</p>
                <a class="button-link" href="${pageContext.request.contextPath}/home">Explore Products</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="cart-panel">
                <div class="cart-card-header">
                    <div>
                        <p class="eyebrow">Shopping bag</p>
                        <h2 class="cart-panel-title">Your curated picks</h2>
                    </div>
                    <span class="cart-pill">${cartItems.size()} item(s)</span>
                </div>

                <table class="cart-table">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cartItems}" var="item">
                        <tr>
                            <td>
                                <span class="cart-item-name">${item.product.name}</span>
                            </td>
                            <td>${item.quantity}</td>
                            <td class="cart-price">$ ${item.lineTotal}</td>
                            <td>
                                <form class="inline-form" action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <button class="delete-btn" type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="cart-footer">
                    <p class="total">💰 Total: $ ${cartTotal}</p>
                    <div class="cart-actions">
                        <a class="button-link secondary" href="${pageContext.request.contextPath}/home">Keep Shopping</a>
                        <a class="button-link" href="${pageContext.request.contextPath}/checkout">Proceed to Checkout →</a>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<footer>
    <p>&copy; 2026 InstaShop. All rights reserved. | Safe & Secure Checkout</p>
</footer>
</body>
</html>
