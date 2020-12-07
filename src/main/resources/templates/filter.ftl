 <form method="get" action="/">
     <ul class="accordion">
         <li class="accordion-item">
             <input id="s1" class="hide" type="checkbox">
             <label for="s1" class="accordion-label">Тип блюда</label>
             <ul class="accordion-child">
                 <li>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_1" name="typeCheck" value="Первые блюда">
                         <label for="checkbox_1">Первые блюда</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_2" name="typeCheck" value="Вторые блюда">
                         <label for="checkbox_2">Вторые блюда</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_3" name="typeCheck" value="Напитки">
                         <label for="checkbox_3">Напитки</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_4" name="typeCheck" value="Салаты">
                         <label for="checkbox_4">Салаты</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_5" name="typeCheck" value="Другое">
                         <label for="checkbox_5">Другое</label>
                     </div>
                 </li>
             </ul>
         </li>
         <li class="accordion-item">
             <input id="s2" class="hide" type="checkbox">
             <label for="s2" class="accordion-label">Время приготовления</label>
             <ul class="accordion-child">
                 <li>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_11" name="timeCheck" value="1">
                         <label for="checkbox_11">до 30 минут</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_12" name="timeCheck" value="2">
                         <label for="checkbox_12">от 30 до 60 минут</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_13" name="timeCheck" value="3">
                         <label for="checkbox_13">от 60 до 90 минут</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_14" name="timeCheck" value="4">
                         <label for="checkbox_14">более 90 минут</label>
                     </div>
                 </li>
             </ul>
         </li>
         <li class="accordion-item">
             <input id="s3" class="hide" type="checkbox">
             <label for="s3" class="accordion-label">Калорийность</label>
             <ul class="accordion-child">
                 <li>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_21" name="caloriesCheck" value="1">
                         <label for="checkbox_21">Низкокалорийные</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_22" name="caloriesCheck" value="2">
                         <label for="checkbox_22">Среднекалорийные</label>
                     </div>
                     <div class="checkbox">
                         <input type="checkbox" id="checkbox_23" name="caloriesCheck" value="3">
                         <label for="checkbox_23">Высококалорийные</label>
                     </div>
                 </li>
             </ul>
         </li>
     </ul>
     <div class="filtr-buttons">
         <div class="sticker-container-filtr">
             <div class="sticker-filtr">
                 <button class="sticker-filtr-content" type="submit"></button>
             </div>
         </div>
         <div class="sticker-container-filtr">
             <div class="sticker-drop">
                 <a class="sticker-drop-content" href="/"></a>
             </div>
         </div>
     </div>
 </form>