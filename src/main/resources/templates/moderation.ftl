<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="styles\css\basic.css">
    <link rel="stylesheet" href="styles\css\header.css">
    <link rel="stylesheet" href="styles\css\search.css">
    <link rel="stylesheet" href="styles\css\register.css">
    <link rel="stylesheet" href="styles\css\contentModeration.css">
    <link rel="stylesheet" href="styles\css\tags.css">
    <link rel="stylesheet" href="styles\css\stickers.css">
    <link rel="stylesheet" href="styles\css\barier.css">
    <link rel="stylesheet" href="styles\css\message.css">
    <link rel="stylesheet" href="styles\css\footer.css">
    <link rel="stylesheet" href="styles\css\adoptationModeration.css">
    <link rel="icon" href="styles\svg\favicon.svg" type="image/png ">
    <title>Culinarum</title>
</head>
<body>
<#include "navbar.ftl">
<div class="content-box">
    <div class="main-page">
        <div class="list">
            <#if recipes?size == 0>
                <#include "message.ftl">
            <#else>
                <div class="saved-container">
                    <div class="saved"><div class="saved-name">Модерация</div></div>
                </div>
            </#if>

            <#list recipes as recipe>
                <div class="recipe-box">
                    <div class="recipe-first-part">
                        <div class="dish-name">
                            <div class="dish-name-content">${recipe.name}</div>
                            <div class="name-span"></div>
                        </div>
                        <div class="dish-photo">
                            <img src="https://res.cloudinary.com/miragost/image/upload/v1606145231/culinarum/${recipe.image}">
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
                        <div class="recipe-buttons">
                            <div class="sticker-container">
                                <div class="sticker-approve">
                                    <a class="sticker-approve-content" href="/approve/${recipe.id}"></a>
                                </div>
                            </div>
                            <div class="sticker-container">
                                <div class="sticker-disapprove">
                                    <a class="sticker-disapprove-content" href="/delete/${recipe.id}"></a>
                                </div>
                            </div>
                            <div class="sticker-container">
                                <div class="sticker-more">
                                    <a class="sticker-more-content" href="/recipe/${recipe.id}"></a>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
</div>
<#include "footer.ftl">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="js\script.js"></script>
</body>
</html>