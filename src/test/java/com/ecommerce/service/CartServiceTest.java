package com.ecommerce.service;

import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class CartServiceTest {

    @Test
    void shouldAggregateSameProductAndCalculateTotal() {
        CartService cartService = new CartService();
        List<CartItem> cart = new ArrayList<>();
        Product product = new Product(1, "Keyboard", "Electronics", new BigDecimal("49.99"), "Mechanical keyboard");

        cartService.addProduct(cart, product, 1);
        cartService.addProduct(cart, product, 2);

        assertEquals(1, cart.size());
        assertEquals(3, cart.get(0).getQuantity());
        assertEquals(new BigDecimal("149.97"), cartService.calculateTotal(cart));
    }
}
