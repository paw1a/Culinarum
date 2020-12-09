create table user_recipe
(
    user_id   bigint not null
        constraint fk5tvd26p8exkl4gjaimejmy67c
            references users,
    recipe_id bigint not null
        constraint fkd7pcgvgubv5j33m36lnsscriq
            references recipe,
    constraint user_recipe_pkey
        primary key (recipe_id, user_id)
);

alter table user_recipe
    owner to cdnooowshipnoa;

