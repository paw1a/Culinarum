package com.example.mpei.repository;

import com.example.mpei.entity.Recipe;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
    List<Recipe> findAllByTypeIn(Collection<String> type);

    Page<Recipe> findAll(Pageable pageable);
    Optional<Recipe> findById(Long id);
    Page<Recipe> findByNameContainsIgnoreCase(String name, Pageable pageable);
}
