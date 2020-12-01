package com.example.culinarum.controller;

import com.example.culinarum.entity.Recipe;
import com.example.culinarum.entity.User;
import com.example.culinarum.repository.RecipeRepository;
import com.example.culinarum.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.IOException;
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
            page = recipeRepository.findByNameContainsIgnoreCase(search, pageable);
            url.append("search=").append(search).append("&");
        } else {
            Set<Recipe> recipes = new HashSet<>();
            if (typeCheck == null)
                typeCheck = Arrays.asList("Первые блюда", "Вторые блюда", "Напитки", "Салаты");
            else for (String s : typeCheck) url.append("typeCheck=").append(s).append("&");

            List<Point> minutes = new ArrayList<>();
            if (timeCheck == null) {
                minutes.add(new Point(0, 30));
                minutes.add(new Point(30, 60));
                minutes.add(new Point(60, 90));
                minutes.add(new Point(90, 1000));
            } else {
                for (String s : timeCheck) {
                    switch (Integer.parseInt(s)) {
                        case 1: minutes.add(new Point(0, 30));break;
                        case 2: minutes.add(new Point(30, 60));break;
                        case 3: minutes.add(new Point(60, 90));break;
                        case 4: minutes.add(new Point(90, 1000));break;
                    }
                }
                for (String s : timeCheck) url.append("timeCheck=").append(s).append("&");
            }

            List<Point> calories = new ArrayList<>();
            if (caloriesCheck == null) {
                calories.add(new Point(0, 100));
                calories.add(new Point(100, 300));
                calories.add(new Point(300, 1000));
            } else {
                for (String s : caloriesCheck) {
                    switch (Integer.parseInt(s)) {
                        case 1: calories.add(new Point(0, 100));break;
                        case 2: calories.add(new Point(100, 300));break;
                        case 3: calories.add(new Point(300, 1000));break;
                    }
                }
                for (String s : caloriesCheck) url.append("caloriesCheck=").append(s).append("&");
            }

            for (Recipe recipe : recipeRepository.findAllByTypeIn(typeCheck)) {
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

    @GetMapping("/add/{id}")
    public String addRecipe(@PathVariable String id, @AuthenticationPrincipal User user) {
        Long idd = Long.parseLong(id);
        Recipe recipe = recipeRepository.findById(idd).orElse(null);
        user = userRepository.findById(user.getId()).orElse(null);
        if(recipe != null) {
            user.getRecipes().add(recipe);
            userRepository.save(user);
        }
        return "redirect:/";
    }

    @GetMapping("/remove/{id}")
    public String removeRecipe(@PathVariable String id, @AuthenticationPrincipal User user) {
        Long idd = Long.parseLong(id);
        Recipe recipe = recipeRepository.findById(idd).orElse(null);
        user = userRepository.findById(user.getId()).orElse(null);
        if(recipe != null) {
            user.getRecipes().remove(recipe);
            userRepository.save(user);
        }
        if(user.getRecipes().isEmpty()) return "redirect:/";
        return "redirect:/favorites";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam String id, Model model) {
        model.addAttribute("recipe", recipeRepository.findById(Long.parseLong(id)).orElse(null));
        return "edit";
    }

    @PostMapping("/edit")
    public String edit(String id, String name, String cuisine, String type,
                       String recipe, String ingredients, Integer minutes, Integer calories,
                       MultipartFile image) {
        Recipe fromDb = recipeRepository.findById(Long.parseLong(id)).orElse(null);
        if(fromDb != null) {
            fromDb.setName(name);
            fromDb.setCuisine(cuisine);
            fromDb.setType(type);
            fromDb.setRecipe(recipe);
            fromDb.setIngredients(ingredients);
            fromDb.setMinutes(minutes);
            fromDb.setCalories(calories);

            recipeRepository.save(fromDb);
        }
        return "redirect:/";
    }

    @GetMapping("/{id}")
    public String recipe(Model model, @PathVariable Long id) {
        model.addAttribute("recipe", recipeRepository.findById(id).orElse(null));
        return "recipe";
    }

    @GetMapping("/favorites")
    public String favorites(Model model, @AuthenticationPrincipal User user) {
        user = userRepository.findById(user.getId()).orElse(null);
        model.addAttribute("recipes", user.getRecipes());
        return "favorites";
    }
}
