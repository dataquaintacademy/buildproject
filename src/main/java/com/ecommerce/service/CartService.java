package com.ecommerce.service;

import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CartService {
    public void addProduct(List<CartItem> cart, Product product, int quantity) {
        if (quantity <= 0) {
            return;
        }

        Optional<CartItem> existingItem = cart.stream()
            .filter(item -> item.getProduct().getId() == product.getId())
            .findFirst();

        if (existingItem.isPresent()) {
            existingItem.get().increaseQuantity(quantity);
            return;
        }

        cart.add(new CartItem(product, quantity));
    }

    public BigDecimal calculateTotal(List<CartItem> cart) {
        return cart.stream()
            .map(CartItem::getLineTotal)
            .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public List<CartItem> emptyCart() {
        return new ArrayList<>();
    }
}
