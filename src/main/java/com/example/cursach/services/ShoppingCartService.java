package com.example.cursach.services;

import com.example.cursach.models.ShoppingCart;
import com.example.cursach.repositories.ShoppingCartRepository;
import com.example.cursach.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ShoppingCartService {
    private final UserRepository userRepository;
    private final ShoppingCartRepository shoppingCartRepository;

    public List<ShoppingCart> listShoppingCart(String name) {
        if (name != null) return shoppingCartRepository.findByProductName(name);
        return shoppingCartRepository.findAll();
    }

    public void saveShoppingCart(ShoppingCart shoppingCart){
        log.info("Saving new product in shopping cart. Title: {}; Author email: {}", shoppingCart.getProductName(), shoppingCart.getUser().getEmail());
        shoppingCartRepository.save(shoppingCart);
    }

    public void deleteShoppingCart(Long id) {
        shoppingCartRepository.deleteById(id);
    }

    public ShoppingCart getShoppingCartById(Long id) {
        return shoppingCartRepository.findById(id).orElse(null);
    }

}
