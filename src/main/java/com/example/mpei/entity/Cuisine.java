package com.example.mpei.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "cuisine")
@ToString
@EqualsAndHashCode(of = "id")
public class Cuisine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    public Cuisine(String name) {
        this.name = name;
    }
}
