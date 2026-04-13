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

    <section class="hero">
        <div class="hero-copy">
            <p class="eyebrow">Welcome to InstaShop</p>
            <h2>Curated essentials for everyday life</h2>
            <p>Discover modern gear, colorful accessories, and fresh essentials designed to fit your everyday style.</p>
            <p>Shop the look with an Instagram-inspired shopping experience that feels bright, bold, and effortless.</p>
        </div>
    </section>

    <div class="product-grid">
        <c:forEach items="${products}" var="product">
            <div class="card">
                <c:choose>
                    <c:when test="${product.name == 'Trail Running Shoes'}">
                        <img src="${pageContext.request.contextPath}/images/trail-running-shoes.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Commuter Backpack'}">
                        <img src="${pageContext.request.contextPath}/images/commuter-backpack.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Thermal Bottle'}">
                        <img src="${pageContext.request.contextPath}/images/thermal-bottle.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Wireless Earbuds'}">
                        <img src="${pageContext.request.contextPath}/images/wireless-earbuds.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Premium Leather Wallet'}">
                        <img src="${pageContext.request.contextPath}/images/premium-leather-wallet.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Sports Watch'}">
                        <img src="${pageContext.request.contextPath}/images/sports-watch.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Canvas Sneakers'}">
                        <img src="${pageContext.request.contextPath}/images/canvas-sneakers.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:when test="${product.name == 'Yoga Mat Set'}">
                        <img src="${pageContext.request.contextPath}/images/yoga-mat-set.svg" alt="${product.name}" class="product-image">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/images/default.jpg" alt="${product.name}" class="product-image">
                    </c:otherwise>
                </c:choose>
                <h2>${product.name}</h2>
                <p class="category">${product.category}</p>
                <p>${product.description}</p>
                <p class="price">$ ${product.price}</p>
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
