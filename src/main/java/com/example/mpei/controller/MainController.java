package com.example.mpei.controller;

import com.example.mpei.entity.Cuisine;
import com.example.mpei.entity.Recipe;
import com.example.mpei.entity.Type;
import com.example.mpei.entity.User;
import com.example.mpei.repository.CuisineRepository;
import com.example.mpei.repository.RecipeRepository;
import com.example.mpei.repository.TypeRepository;
import com.example.mpei.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class MainController {

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private CuisineRepository cuisineRepository;

    @Autowired
    private TypeRepository typeRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String main(@RequestParam(required = false) String search, @PageableDefault(sort = {"id"},
            direction = Sort.Direction.ASC) Pageable pageable, Model model,
                       @RequestParam(name = "cuisineCheck", required = false) List<String> cuisineCheck,
                       @RequestParam(name = "typeCheck", required = false) List<String> typeCheck) {
        Page<Recipe> page;

        String url = "?";

        if(typeCheck == null) {
            typeCheck = new ArrayList<>();
            for(Type type : typeRepository.findAll()) typeCheck.add(type.getName());
        } else {
            for (String s : typeCheck) url += "typeCheck="+s+"&";
        }
        if(cuisineCheck == null) {
            cuisineCheck = new ArrayList<>();
            for(Cuisine cuisine : cuisineRepository.findAll()) cuisineCheck.add(cuisine.getName());
        } else {
            for(String s : cuisineCheck) url += "cuisineCheck="+s+"&";
        }

        if(search != null && !search.isEmpty()) {
            page = recipeRepository.findByNameContainsIgnoreCase(search, pageable);
            url += "search="+search+"&";
        } else {
            page = recipeRepository.findAllByCuisineInAndTypeIn(
                    cuisineCheck, typeCheck, pageable);
        }

        Iterable<Cuisine> cuisines = cuisineRepository.findAll();
        Collections.sort((List<Cuisine>) cuisines, Comparator.comparingInt(o -> o.getName().charAt(0)));
        Iterable<Type> types = typeRepository.findAll();

        model.addAttribute("page", page);
        model.addAttribute("search", search);
        model.addAttribute("cuisines", cuisines);
        model.addAttribute("types", types);
        model.addAttribute("url", url);
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

    /*@GetMapping("/test")
    public String test() {
        List<Recipe> list = recipeRepository.findAll();
        Set<String> set = new HashSet<>();
        list.forEach(recipe -> {
            set.add(recipe.getType());
        });
        set.forEach(s -> typeRepository.save(new Type(s)));

        Set<String> set1 = new HashSet<>();
        list.forEach(recipe -> {
            set1.add(recipe.getCuisine());
        });
        set1.forEach(s -> cuisineRepository.save(new Cuisine(s)));

        return "main";
    }*/

}
