package com.example.cursach.controllers;

import com.example.cursach.models.Product;
import com.example.cursach.models.ShoppingCart;
import com.example.cursach.models.User;
import com.example.cursach.services.ProductService;
import com.example.cursach.services.ShoppingCartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ShoppingCartController{
    private final ShoppingCartService shoppingCartService;
    private final ProductService productService;

    @PostMapping("/product/createCart")
    public String createShoppingCart(ShoppingCart shoppingCart) {
        shoppingCartService.saveShoppingCart(shoppingCart);
        return "redirect:/";
    }

    @PostMapping("/product/deleteCart/{id}")
    public String deleteCart(@PathVariable Long id) {
        shoppingCartService.deleteShoppingCart(id);
        return "redirect:/";
    }
    @GetMapping("/cart/{id}")
    public String shoppingCart(@RequestParam(name = "name", required = false) String name, Principal principal, User user, Model model, ShoppingCart shoppingCart, Product product){
        model.addAttribute("shoppingCarts", shoppingCartService.listShoppingCart(name));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("products", product);
        return "shopping-cart";
    }
}