package com.example.culinarum.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "type")
@ToString
@EqualsAndHashCode(of = "id")
public class Type {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    public Type(String name) {
        this.name = name;
    }
}
