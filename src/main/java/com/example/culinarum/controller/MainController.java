package com.example.culinarum.controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.culinarum.entity.Recipe;
import com.example.culinarum.entity.Role;
import com.example.culinarum.entity.User;
import com.example.culinarum.repository.RecipeRepository;
import com.example.culinarum.repository.UserRepository;
import org.cloudinary.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String main(@RequestParam(required = false) String search, @PageableDefault(sort = {"id"},
            direction = Sort.Direction.ASC) Pageable pageable, Model model,
                       @RequestParam(name = "timeCheck", required = false) List<String> timeCheck,
                       @RequestParam(name = "caloriesCheck", required = false) List<String> caloriesCheck,
                       @RequestParam(name = "typeCheck", required = false) List<String> typeCheck) {
        Page<Recipe> page;
        StringBuilder url = new StringBuilder("?");

        if(search != null && !search.isEmpty()) {
            page = recipeRepository.findByNameContainsIgnoreCaseAndAccepted(search, Boolean.TRUE, pageable);
            url.append("search=").append(search).append("&");
        } else {
            Set<Recipe> recipes = new HashSet<>();
            if (typeCheck == null)
                typeCheck = Arrays.asList("Первые блюда", "Вторые блюда", "Напитки", "Салаты", "Другое");
            else for (String s : typeCheck) url.append("typeCheck=").append(s).append("&");

            List<Point> minutes = new ArrayList<>();
            if (timeCheck == null) {
                minutes.add(new Point(0, 30));
                minutes.add(new Point(30, 60));
                minutes.add(new Point(60, 90));
                minutes.add(new Point(90, Integer.MAX_VALUE));
            } else {
                for (String s : timeCheck) {
                    switch (Integer.parseInt(s)) {
                        case 1: minutes.add(new Point(0, 30));break;
                        case 2: minutes.add(new Point(30, 60));break;
                        case 3: minutes.add(new Point(60, 90));break;
                        case 4: minutes.add(new Point(90, Integer.MAX_VALUE));break;
                    }
                }
                for (String s : timeCheck) url.append("timeCheck=").append(s).append("&");
            }

            List<Point> calories = new ArrayList<>();
            if (caloriesCheck == null) {
                calories.add(new Point(0, 100));
                calories.add(new Point(100, 300));
                calories.add(new Point(300, Integer.MAX_VALUE));
            } else {
                for (String s : caloriesCheck) {
                    switch (Integer.parseInt(s)) {
                        case 1: calories.add(new Point(0, 100));break;
                        case 2: calories.add(new Point(100, 300));break;
                        case 3: calories.add(new Point(300, Integer.MAX_VALUE));break;
                    }
                }
                for (String s : caloriesCheck) url.append("caloriesCheck=").append(s).append("&");
            }

            for (Recipe recipe : recipeRepository.findAllByTypeInAndAccepted(typeCheck, Boolean.TRUE)) {
                for (Point m : minutes)
                    if (recipe.getMinutes() >= m.x && recipe.getMinutes() <= m.y) {
                        for (Point c : calories)
                            if (recipe.getCalories() >= c.x && recipe.getCalories() <= c.y) recipes.add(recipe);
                    }
            }

            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), recipes.size());
            page = new PageImpl<>(new ArrayList<>(recipes).subList(start, end), pageable, recipes.size());
        }

        model.addAttribute("page", page);
        model.addAttribute("search", search);
        model.addAttribute("url", url.toString());
        return "main";
    }

    @GetMapping("/favorites")
    public String favorites(Model model, @AuthenticationPrincipal User user) {
        user = userRepository.findById(user.getId()).orElse(null);
        model.addAttribute("recipes", user.getRecipes());
        return "favorites";
    }

    @GetMapping("/moderation")
    public String moderation(Model model) {
        model.addAttribute("recipes", recipeRepository.findAllByAccepted(Boolean.FALSE));
        return "moderation";
    }

    @GetMapping("/approve/{id}")
    public String approveRecipe(@PathVariable Long id) {
        Recipe recipe = recipeRepository.findById(id).orElse(null);
        if(recipe != null) {
            recipe.setAccepted(true);
            recipeRepository.save(recipe);
        }
        return "redirect:/moderation";
    }

    @GetMapping("/test")
    public void test() {
        for (int i = 0; i < 100; i++) {
            Recipe recipe = new Recipe();
            recipeRepository.save(recipe);
        }
    }

}
