package com.example.cursach.repositories;

import com.example.cursach.models.ShoppingCart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Long> {
    List<ShoppingCart> findByProductName(String name);
}
