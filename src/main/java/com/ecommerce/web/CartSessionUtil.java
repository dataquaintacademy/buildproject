package com.ecommerce.web;

import com.ecommerce.model.CartItem;

import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

public final class CartSessionUtil {
    public static final String CART_SESSION_KEY = "cartItems";

    private CartSessionUtil() {
    }

    @SuppressWarnings("unchecked")
    public static List<CartItem> getOrCreateCart(HttpSession session) {
        Object existing = session.getAttribute(CART_SESSION_KEY);
        if (existing instanceof List<?>) {
            return (List<CartItem>) existing;
        }

        List<CartItem> cart = new ArrayList<>();
        session.setAttribute(CART_SESSION_KEY, cart);
        return cart;
    }
}
