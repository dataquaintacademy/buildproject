<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InstaShop - Shop Like Never Before</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <header>
        <h1>InstaShop</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/cart">🛍️ View Cart</a>
    </header>

    <div class="product-grid">
        <c:forEach items="${products}" var="product">
            <div class="card">
                <c:choose>
                    <c:when test="${product.category == 'Electronics'}">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300&h=300&fit=crop" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.category == 'Footwear'}">
                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&h=300&fit=crop" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.category == 'Accessories'}">
                        <img src="https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300&h=300&fit=crop" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.category == 'Lifestyle'}">
                        <img src="https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=300&h=300&fit=crop" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:otherwise>
                        <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=300&h=300&fit=crop" alt="${product.name}" class="product-image">
                    </c:otherwise>
                </c:choose>
                <h2>${product.name}</h2>
                <p class="category">${product.category}</p>
                <p>${product.description}</p>
                <p class="price">₹ ${product.price}</p>
                <form method="post" action="${pageContext.request.contextPath}/cart/add">
                    <input type="hidden" name="productId" value="${product.id}">
                    <label>
                        Qty
                        <input type="number" name="quantity" value="1" min="1" max="10">
                    </label>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<footer>
    <p>&copy; 2026 InstaShop. All rights reserved. | Fast Delivery | Secure Payment</p>
</footer>
</body>
</html>
