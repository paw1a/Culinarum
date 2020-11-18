package com.example.mpei.repository;

import com.example.mpei.entity.Cuisine;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CuisineRepository extends CrudRepository<Cuisine, Long> {
}
