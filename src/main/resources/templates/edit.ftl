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
      
      <link rel="stylesheet" href="styles\css\basic.css">
      <link rel="stylesheet" href="styles\css\header.css">
      <link rel="stylesheet" href="styles\css\search.css">
      <link rel="stylesheet" href="styles\css\register.css">
      <link rel="stylesheet" href="styles\css\contentEdit.css">
      <link rel="stylesheet" href="styles\css\stickers.css">
      <link rel="stylesheet" href="styles\css\barier.css">
      <link rel="stylesheet" href="styles\css\footer.css">
      <link rel="stylesheet" href="styles\css\adoptationEdit.css">
      <link rel="icon" href="styles\svg\favicon.svg" type="image/png ">
      <title>Culinarum</title>
   </head>
   <body>

<#include "navbar.ftl">
<div class="content-box">
         <div class="main-page">
            <div class="list">
               <form action="/update" enctype="multipart/form-data" method="post">
                  <div class="recipe-box">
                     <input type="hidden" value="${recipe.id}" name="id">
                     <div class="recipe-first-part">
                        <div class="dish-name">
                           <textarea maxlength="50" required name="name" placeholder="Название рецепта">${recipe.name}</textarea>
                           <div class="name-span"></div>
                        </div>
                        <div class="dish-photo">
                           <img alt="Фото не найдено" id="uploadPreview"
                                src="https://res.cloudinary.com/miragost/image/upload/v1606145231/culinarum/${recipe.image}">
                        </div>
                        <div class="upload-file"></div>
                        <div class="edit-image">
                           <input type="file" required name="image" id="upload-input" accept="image/*"
                                  onchange="PreviewImage();" class="upload-file-input">
                           <label class="new-upload-file-input" for="upload-input">
                              <div class="upload-file-status">файл не выбран</div>
                              <div class="upload-file-button">Выбрать</div>
                           </label>
                        </div>
                        <div class="recipe-tags">
                           <div class="tag-content">
                              <textarea maxlength="40" required name="cuisine" placeholder="Кухня мира">${recipe.cuisine}</textarea>
                           </div>
                           <div class="tag-content">
                              <textarea maxlength="40" required name="type" placeholder="Вид блюда">${recipe.type}</textarea>
                           </div>
                        </div>
                        <div class="recipe-characterisctics">
                           <div class="recipe-time">
                              <div class="calories-name">
                              </div>
                              <textarea maxlength="5" required name="minutes" placeholder="Время приготовления">${recipe.minutes}</textarea>
                           </div>
                           <div class="recipe-calories">
                              <div class="calories-name">
                              </div>
                              <textarea maxlength="5" required name="calories" placeholder="Количество калорий">${recipe.calories}</textarea>
                           </div>
                        </div>
                     </div>
                     <div class="recipe-second-part">
                        <div class="recipe-description">
                           <div class="description-name">
                              <div class="description-name-content">Приготовление</div>
                              <div class="name-span"></div>
                           </div>
                           <textarea name="recipe" required placeholder="Введите рецепт приготовления">${recipe.recipe}</textarea>
                        </div>
                        <div class="recipe-description">
                           <div class="description-name">
                              <div class="description-name-content">Ингредиенты</div>
                              <div class="name-span"></div>
                           </div>
                           <textarea name="ingredients" required placeholder="Введите ингредиенты">${recipe.ingredients}</textarea>
                        </div>
                        <div class="save-edit">
                           <button type="submit">Сохранить</button>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
<#include "footer.ftl">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="js\script.js"></script>
<script src="js\modal.js"></script>
<script src="js\print.js"></script>
</body>
</html>