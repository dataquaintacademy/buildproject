package com.ecommerce.web;

import com.ecommerce.model.CartItem;
import com.ecommerce.service.CartService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CartItem> cart = CartSessionUtil.getOrCreateCart(request.getSession());
        request.setAttribute("cartItems", cart);
        request.setAttribute("cartTotal", cartService.calculateTotal(cart));
        request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
    }
}
