package com.example.culinarum.repository;

import com.example.culinarum.entity.Recipe;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
    List<Recipe> findAllByTypeInAndAccepted(Collection<String> type, Boolean accepted);

    Page<Recipe> findAll(Pageable pageable);
    List<Recipe> findAllByAccepted(Boolean accepted);
    Optional<Recipe> findById(Long id);
    Page<Recipe> findByNameContainsIgnoreCaseAndAccepted(String name, Boolean accepted, Pageable pageable);
}
