<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopHub - Online Shopping Made Easy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <header>
        <h1>ShopHub Bazaar</h1>
        <a class="button-link" href="${pageContext.request.contextPath}/cart">🛍️ View Cart</a>
    </header>

    <div class="product-grid">
        <c:forEach items="${products}" var="product">
            <div class="card">
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
    <p>&copy; 2026 ShopHub Bazaar. All rights reserved. | Fast Delivery | Secure Payment</p>
</footer>
</body>
</html>
