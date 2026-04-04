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

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CartItem> cart = CartSessionUtil.getOrCreateCart(request.getSession());
        request.setAttribute("cartItems", cart);
        request.setAttribute("cartTotal", cartService.calculateTotal(cart));
        request.getRequestDispatcher("/WEB-INF/views/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().setAttribute(CartSessionUtil.CART_SESSION_KEY, cartService.emptyCart());
        response.sendRedirect(request.getContextPath() + "/order-success");
    }
}
