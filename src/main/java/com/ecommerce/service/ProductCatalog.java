package com.ecommerce.service;

import com.ecommerce.model.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class ProductCatalog {
    private static final List<Product> PRODUCTS;

    static {
        List<Product> items = new ArrayList<>();
        items.add(new Product(1, "Trail Running Shoes", "Footwear", new BigDecimal("89.99"), "Lightweight shoes for daily training"));
        items.add(new Product(2, "Commuter Backpack", "Accessories", new BigDecimal("59.50"), "Water-resistant backpack with laptop sleeve"));
        items.add(new Product(3, "Thermal Bottle", "Lifestyle", new BigDecimal("24.00"), "Insulated stainless steel bottle"));
        items.add(new Product(4, "Wireless Earbuds", "Electronics", new BigDecimal("129.00"), "Noise-reducing earbuds with charging case"));
        PRODUCTS = Collections.unmodifiableList(items);
    }

    public List<Product> listProducts() {
        return PRODUCTS;
    }

    public Optional<Product> findById(int productId) {
        return PRODUCTS.stream()
            .filter(product -> product.getId() == productId)
            .findFirst();
    }
}
