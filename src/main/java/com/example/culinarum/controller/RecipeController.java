package com.example.culinarum.controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.culinarum.entity.Recipe;
import com.example.culinarum.entity.Role;
import com.example.culinarum.entity.User;
import com.example.culinarum.repository.RecipeRepository;
import com.example.culinarum.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
public class RecipeController {

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/{id}")
    public String recipe(Model model, @PathVariable Long id) {
        model.addAttribute("recipe", recipeRepository.findById(id).orElse(null));
        return "recipe";
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
        return "redirect:/#"+id;
    }

    @GetMapping("/new")
    public String newRecipe() {
        return "new";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam String id, Model model) {
        model.addAttribute("recipe", recipeRepository.findById(Long.parseLong(id)).orElse(null));
        return "edit";
    }

    @PostMapping("/update")
    public String update(String id, String name, String cuisine, String type,
                         String recipe, String ingredients, Integer minutes, Integer calories,
                         MultipartFile image, @AuthenticationPrincipal User user) {

        Recipe updatedRecipe;
        if(id != null && !id.isEmpty())
            updatedRecipe = recipeRepository.findById(Long.parseLong(id)).orElse(null);
        else updatedRecipe = new Recipe();

        if(updatedRecipe != null) {
            updatedRecipe.setName(name);
            updatedRecipe.setCuisine(cuisine);
            updatedRecipe.setType(type);
            updatedRecipe.setRecipe(recipe);
            updatedRecipe.setIngredients(ingredients);
            updatedRecipe.setMinutes(minutes);
            updatedRecipe.setCalories(calories);
            updatedRecipe.setAccepted(user != null && user.getRole() == Role.ROLE_ADMIN);

            Cloudinary cloudinary = new Cloudinary("cloudinary://535661528615272:aHyZLIYT5rpMmkUljmewhfZlpuk@miragost");
            try {
                Map response = cloudinary.uploader().upload(image.getBytes(), ObjectUtils.asMap("folder", "culinarum"));
                updatedRecipe.setImage(response.get("public_id").toString().replace(
                        "culinarum/", "") + "." + response.get("format").toString());
            } catch(Exception e) { System.err.println("Upload failed"); }

            recipeRepository.save(updatedRecipe);
        }
        return "redirect:";
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
        if(user.getRecipes().isEmpty()) return "redirect:/#"+id;
        return "redirect:/favorites";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id, @AuthenticationPrincipal User user) {
        Recipe fromDb = recipeRepository.findById(id).orElse(null);
        if(fromDb != null) {
            fromDb.getUsers().remove(user);
            userRepository.save(user);
            recipeRepository.delete(fromDb);
        }
        return "redirect:/";
    }
}
