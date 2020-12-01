<#import "security.ftl" as s>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="css\basic.css">
    <link rel="stylesheet" href="css\header.css">
    <link rel="stylesheet" href="css\search.css">
    <link rel="stylesheet" href="css\register.css">
    <link rel="stylesheet" href="css\contentRecipe.css">
    <link rel="stylesheet" href="css\stickers.css">
    <link rel="stylesheet" href="css\barier.css">
    <link rel="stylesheet" href="css\footer.css">
    <link rel="stylesheet" href="css\adoptationRecipe.css">
    <link rel="icon" href="css\svg\favicon.svg" type="image/png ">
    <title>Culinarum</title>
</head>
<body>

<#include "navbar.ftl">
<div class="content-box">
    <div class="main-page">
        <div class="list">
            <div class="recipe-box">
                <form action="/edit" enctype="multipart/form-data" method="post">
                    <input type="hidden" value="${recipe.id}" name="id">
                    <div class="recipe-first-part">
                        <div class="dish-name">
                            <input type="text" value="${recipe.name}" name="name">
                            <div class="name-span"></div>
                        </div>
                        <div class="dish-photo">
                            <img src="https://res.cloudinary.com/miragost/image/upload/v1606145231/culinarum/${recipe.image}">
                        </div>
                        <input type="file" name="image">
                        <div class="recipe-tags">
                            <div class="tag-content">
                                <input type="text" value="${recipe.cuisine}" name="cuisine">
                            </div>
                            <div class="tag-content">
                                <input type="text" value="${recipe.type}" name="type">
                            </div>
                        </div>
                        <div class="recipe-characterisctics">
                            <div class="recipe-time">
                                <div class="calories-name">
                                </div>
                                <input type="number" value="${recipe.minutes}" name="minutes">мин
                            </div>
                            <div class="recipe-calories">
                                <div class="calories-name">
                                </div>
                                <input type="number" value="${recipe.calories}" name="calories">ккал
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
                                <div class="sticker-download">
                                    <a class="sticker-download-content" href="#"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="recipe-second-part">
                        <div class="recipe-description">
                            <div class="description-name">
                                <div class="description-name-content">Приготовление</div>
                                <div class="name-span"></div>
                            </div>
                            <input type="text" value="${recipe.recipe}" name="recipe">
                        </div>
                        <div class="recipe-description">
                            <div class="description-name">
                                <div class="description-name-content">Ингредиенты</div>
                                <div class="name-span"></div>
                            </div>
                            <input type="text" value="${recipe.ingredients}" name="ingredients">
                        </div>
                    </div>
                    <button type="submit">Сохранить</button>
                </form>
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