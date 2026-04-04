package com.ecommerce.web;

import com.ecommerce.model.CartItem;
import com.ecommerce.service.CartService;
import com.ecommerce.service.ProductCatalog;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cart/add")
public class AddToCartServlet extends HttpServlet {
    private final ProductCatalog productCatalog = new ProductCatalog();
    private final CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = parseIntOrDefault(request.getParameter("productId"), -1);
        int quantity = parseIntOrDefault(request.getParameter("quantity"), 1);

        List<CartItem> cart = CartSessionUtil.getOrCreateCart(request.getSession());
        productCatalog.findById(productId).ifPresent(product -> cartService.addProduct(cart, product, quantity));

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    private int parseIntOrDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }
}
