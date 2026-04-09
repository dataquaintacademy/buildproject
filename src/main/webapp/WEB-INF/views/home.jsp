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
                        <img src="${pageContext.request.contextPath}/images/electronics.jpg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.category == 'Footwear'}">
                        <img src="${pageContext.request.contextPath}/images/footwear.jpg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.category == 'Accessories'}">
                        <img src="${pageContext.request.contextPath}/images/accessories.jpg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.category == 'Lifestyle'}">
                        <img src="${pageContext.request.contextPath}/images/lifestyle.jpg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/images/default.jpg" alt="${product.name}" class="product-image">
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
