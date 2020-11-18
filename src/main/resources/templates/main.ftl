<#import "security.ftl" as s>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&family=Yanone+Kaffeesatz:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="css\style.css">
    <link rel="icon" href="css\svg\favicon.svg" type="image/png">
    <title>Culinarum</title>
</head>
<body>

<#include "navbar.ftl">
<#include "modal.ftl">
<div class="content-box">
    <div class="main-page">
        <#include "filter.ftl">
        <div class="list">
            <#list page.content as recipe>
                <div class="recipe-box">
                    <div class="recipe-first-part">
                        <div class="dish-name">
                            <div class="dish-name-content">${recipe.name}</div>
                            <div class="name-span"></div>
                        </div>
                        <div class="dish-photo">
                            <img src="css\images\pizza.jpg">
                        </div>
                        <div class="recipe-tags">
                            <div class="tag-content">
                                <a class="tag" href="#">${recipe.type}</a>
                            </div>
                            <div class="tag-content">
                                <a class="tag" href="#">${recipe.cuisine}</a>
                            </div>
                        </div>
                    </div>
                    <div class="recipe-second-part">
                        <div class="recipe-description">
                            <div class="description-name">
                                <div class="description-name-content">Рецепт</div>
                                <div class="name-span"></div>
                            </div>
                            <div class="description-text">${recipe.recipe}</div>
                        </div>
                        <div class="recipe-characterisctics">
                            <div class="recipe-time">
                                <div class="calories-name"></div>
                                <div class="time-text">10 min</div>
                            </div>
                            <div class="recipe-calories">
                                <div class="calories-name"></div>
                                <div class="calories-text">300 cal</div>
                            </div>
                        </div>
                        <div class="recipe-buttons">
                            <div class="sticker-container">
                                    <#if s.known && recipe.getUsers()?seq_contains(s.user)>
                                        <div class="sticker-delete">
                                            <a class="sticker-delete-content" href="/remove/${recipe.id}"></a>
                                        </div>
                                    <#else>
                                        <div class="sticker-plus">
                                            <a class="sticker-plus-content <#if !s.known>disabled</#if>"
                                               href="/add/<#if s.known>${recipe.id}</#if>"></a>
                                        </div>
                                    </#if>
                            </div>
                            <div class="sticker-container">
                                <div class="sticker-more">
                                    <a class="sticker-more-content <#if !s.known>disabled</#if>" href="/${recipe.id}"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>

            <div class="button-show">
                <div class="sticker-container-show">
                    <div class="sticker-show">
                        <a class="sticker-show-content" href="#"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "footer.ftl">

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="js\script.js"></script>
<script src="js\modal.js"></script>
</body>
</html>