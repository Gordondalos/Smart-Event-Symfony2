# создание страниц – это три простых шага, включающих маршрут, контроллер и (опционально) шаблон;
эля этого
1. перейти в дерикторию с проектом в командной строке
2 выполнить команду создания бандла
например
#php app/console generate:bundle --namespace=Blog/MenuBundle --format=yml

3. Зайти в src/['Название бандла']/Resources/config/routing.yml и поправить его
4. Зайти src/['Название бандла']/Controller/DefoultController.php и поправить его
5. Зайти src/['Название бандла']/views/Default/index.html.twig и попраить его



поставить знак копирайта alt + 0+1+6+9

# Удалить хеши
php app/console cache:clear --env=prod --no-debug

# Добавить новый бандл

['что то написано'] -- так указываю то что можно заменить

php app/console generate:bundle --namespace=['Acme']/['HelloBundle]' --format=yml
например
#php app/console generate:bundle --namespace=Acme/HelloBundle --format=yml

Автоформатирование кода CTRL+ALT+L

перейти к строке ctrl + G

Подвинуть текст вправо - выделить текст и таб

-- в лево Shift + tab



Выполнить произвольный метод в произвольном месте
 {{ render(controller('BlogArticleBundle:Category:all_allCategory')) }}


при создании блога были запущены следующие команды

> php.exe C:\xampp\htdocs\blog\app\console doctrine:mapping:import BlogArticleBundle yml
> php.exe C:\xampp\htdocs\blog\app\console doctrine:mapping:import BlogMenuBundle yml
# Код указанный выше притянул всю бд



> php.exe C:\xampp\htdocs\blog\app\console doctrine:generate:entities BlogArticleBundle
> php.exe C:\xampp\htdocs\blog\app\console doctrine:generate:entities BlogMenuBundle
# Код указанный выше притянул создал сучности

Создаем круд

$ bin/console doctrine:generate:crud --entity=BlogSliderBundle:Slider --with-write
$ bin/console doctrine:generate:crud --entity=BlogMenuBundle:Menu --with-write
текст выше генерирует круд используя энтити менюбандла и таблицу меню в бд

$ bin/console doctrine:generate:crud --entity=FDevsCRUDBundle:Article --with-write
$ bin/console doctrine:generate:crud --entity=FDevsCRUDBundle:fos_user --with-write