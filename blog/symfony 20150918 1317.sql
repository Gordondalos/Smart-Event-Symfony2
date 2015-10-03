--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.3.358.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 18.09.2015 13:17:43
-- Версия сервера: 5.6.21
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE symfony;

--
-- Описание для таблицы article
--
DROP TABLE IF EXISTS article;
CREATE TABLE article (
  article_id INT(11) NOT NULL AUTO_INCREMENT,
  article_text LONGTEXT NOT NULL,
  article_date DATE NOT NULL,
  article_ispublished TINYINT(1) NOT NULL,
  article_title VARCHAR(255) NOT NULL,
  article_category_id INT(11) NOT NULL,
  short_text TEXT DEFAULT NULL,
  main TINYINT(1) DEFAULT 1,
  general TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (article_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 14
AVG_ROW_LENGTH = 6553
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы category
--
DROP TABLE IF EXISTS category;
CREATE TABLE category (
  category_id INT(11) NOT NULL AUTO_INCREMENT,
  category_name LONGTEXT NOT NULL,
  category_description LONGTEXT NOT NULL,
  category_parent INT(11) DEFAULT 0,
  PRIMARY KEY (category_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 24
AVG_ROW_LENGTH = 1170
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы fos_user
--
DROP TABLE IF EXISTS fos_user;
CREATE TABLE fos_user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  username_canonical VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  email_canonical VARCHAR(255) NOT NULL,
  enabled TINYINT(1) NOT NULL,
  salt VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  last_login DATETIME DEFAULT NULL,
  locked TINYINT(1) NOT NULL,
  expired TINYINT(1) NOT NULL,
  expires_at DATETIME DEFAULT NULL,
  confirmation_token VARCHAR(255) DEFAULT NULL,
  password_requested_at DATETIME DEFAULT NULL,
  roles LONGTEXT NOT NULL COMMENT '(DC2Type:array)',
  credentials_expired TINYINT(1) NOT NULL,
  credentials_expire_at DATETIME DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UNIQ_957A647992FC23A8 (username_canonical),
  UNIQUE INDEX UNIQ_957A6479A0D96FBF (email_canonical)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы slider
--
DROP TABLE IF EXISTS slider;
CREATE TABLE slider (
  id INT(11) NOT NULL AUTO_INCREMENT,
  a_href VARCHAR(255) DEFAULT NULL,
  img_src VARCHAR(255) NOT NULL,
  img_alt_text VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_unicode_ci
COMMENT = 'В данной таблице хранятся данные центрально слайдера';

-- 
-- Вывод данных для таблицы article
--
INSERT INTO article VALUES
(3, '<!-- Start WOWSlider.com HEAD section --><!-- End WOWSlider.com HEAD section -->\r\n<p><img alt="" src="/upload/newsimg53011.jpg" style="float:left; height:139px; margin-left:10px; margin-right:10px; width:100px" />Исполнительница главной роли в сериале &quot;<a href="http://serials.kinonews.ru/serial_20243/castle">Касл</a>&quot;&nbsp;<a href="http://www.kinonews.ru/person_8608/stana-katic">Стана Катик</a>&nbsp;подписала новый контракт на участие в продолжении шоу, в то время как создатель сериала&nbsp;<a href="http://www.kinonews.ru/person_17108/andrew-w-marlowe">Эндрю У. Марлоу</a>&nbsp;и его супруга, исполнительный продюсер Терри Миллер, покинули проект. Об этом сообщает издание The Hollywood Reporter.<br />\r\nКанал ABC продлил процедурал, главную роль в котором исполняет&nbsp;<a href="http://www.kinonews.ru/person_5825/nathan-fillion">Натан Филлион</a>, на восьмой сезон в пятницу, 8 мая 2015 года. В предстоящем сезоне функции шоураннеров возложены на сценаристов&nbsp;<a href="http://www.kinonews.ru/person_17109/terence-paul-winter">Теренса Пола Винтера</a>&nbsp;и Алекси Хоули, заменивших выбывшего с поста Дэвида Аманна.<br />\r\nЧто касается Марлоу, то он сосредоточится на работе над потенциальным спин-оффом &quot;Касла&quot; и не будет принимать участие в разработке восьмого сезона.<br />\r\nВо вторник утром, 12 мая, Марлоу и Миллер, оставили на своей странице в Twitter обращение к фанатам сериала, поблагодарив их за преданность шоу и объявив о своем уходе после семи сезонов.<br />\r\nПрезидент компании ABC Entertainment Group Пол Ли подтвердил, что восьмой сезон сериала &quot;Касл&quot; не будет последним, и подчеркнул, что такие сериалы канала, как &quot;<a href="http://serials.kinonews.ru/serial_14017/greys-anatomy">Анатомия страсти</a>&quot; и &quot;Касл&quot;, являются &quot;яркими брендами&quot; со &quot;страстной аудиторией&quot;, и что он был бы рад, если бы они &quot;шли еще многие годы&quot;.<br />\r\nСедьмой сезон &quot;Касла&quot; завершился 11 мая 2015 года. Процедурал, выходящий на ABC по понедельникам, собирает за неделю в среднем по 12,7 миллиона зрителей.</p>\r\n\r\n<p><img alt="" src="/upload/newsimg53011.jpg" style="float:left; height:417px; margin-left:10px; margin-right:10px; width:300px" /></p>\r\n\r\n<p>&nbsp;</p>', '2015-09-12', 1, '"Касл"', 4, NULL, 1, NULL),
(5, '<p><img alt="" src="/upload/stana-katic-1.jpg" style="float:left; height:250px; margin-left:10px; margin-right:10px; width:400px" /><strong>Стана Катич<sup>[1]</sup></strong>&nbsp;(англ.&nbsp;<em>Stana Katic: /ˈstɑːnə ˈk&aelig;tɨk/</em>&nbsp;; род.&nbsp;26 апреля&nbsp;1978,&nbsp;Гамильтон,&nbsp;Онтарио,&nbsp;Канада)&nbsp;&mdash; канадская актриса&nbsp;сербско-хорватского&nbsp;происхождения, наиболее известная по роли детектива Кейт Беккет в телесериале &laquo;Касл&raquo;.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#000000">Катич родилась в городе&nbsp;Гамильтон, штат&nbsp;Онтарио,&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BD%D0%B0%D0%B4%D0%B0" title="Канада"><span style="color:#000000">Канада</span></a><span style="color:#000000">. Отец&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D0%B1" title="Серб"><span style="color:#000000">серб</span></a><span style="color:#000000">, мать&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%A5%D0%BE%D1%80%D0%B2%D0%B0%D1%82%D1%8B" title="Хорваты"><span style="color:#000000">хорватка</span></a><span style="color:#000000">, эмигрировавшая изЮгославии. Рассказывая о своей национальности Стана говорит: &laquo;Мои родители - сербы из Хорватии. Я называю нас&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%94%D0%B0%D0%BB%D0%BC%D0%B0%D1%86%D0%B8%D1%8F" title="Далмация"><span style="color:#000000">далматами</span></a><span style="color:#000000">&raquo;</span><sup><a href="https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%82%D0%B8%D1%87,_%D0%A1%D1%82%D0%B0%D0%BD%D0%B0#cite_note-2"><span style="color:#000000">[2]</span></a></sup><span style="color:#000000">. Её отец родом из&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%92%D1%80%D0%BB%D0%B8%D0%BA%D0%B0" title="Врлика"><span style="color:#000000">Врлика</span></a><span style="color:#000000">, мать - из&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%B8%D0%BD%D1%8C_(%D0%A5%D0%BE%D1%80%D0%B2%D0%B0%D1%82%D0%B8%D1%8F)" title="Синь (Хорватия)"><span style="color:#000000">Сини</span></a><sup><a href="https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%82%D0%B8%D1%87,_%D0%A1%D1%82%D0%B0%D0%BD%D0%B0#cite_note-3"><span style="color:#000000">[3]</span></a></sup><span style="color:#000000">. Позднее Катич со своей семьёй переехала в город Аврора в штате&nbsp;Иллинойс. После окончания средней школы &laquo;Вест Аврора&raquo; в 1996 году она обучалась в&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%A2%D0%BE%D1%80%D0%BE%D0%BD%D1%82%D1%81%D0%BA%D0%B8%D0%B9_%D1%83%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%82%D0%B5%D1%82" title="Торонтский университет"><span style="color:#000000">Торонтском университете</span></a><span style="color:#000000">&nbsp;и в театральной школе&nbsp;Университета Де Поля, носящей название Гудменовской школы драмы, где училась актёрскому мастерству с 2000 по 2004 год</span><sup><a href="https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%82%D0%B8%D1%87,_%D0%A1%D1%82%D0%B0%D0%BD%D0%B0#cite_note-autogenerated1-4"><span style="color:#000000">[4]</span></a></sup><span style="color:#000000">. У Станы Катич четыре брата и одна сестра.</span></p>\r\n\r\n<p>Кроме&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Английский язык">английского языка</a>, она также владеет&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D1%80%D0%B1%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Сербский язык">сербским</a>,&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%BB%D0%BE%D0%B2%D0%B5%D0%BD%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Словенский язык">словенским</a>,&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A4%D1%80%D0%B0%D0%BD%D1%86%D1%83%D0%B7%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Французский язык">французским</a>&nbsp;и&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%98%D1%82%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Итальянский язык">итальянским</a>&nbsp;языками. Имеет двойное гражданство&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%A8%D0%90" title="США">США</a>&nbsp;и&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BD%D0%B0%D0%B4%D0%B0" title="Канада">Канады</a><sup><a href="https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D1%82%D0%B8%D1%87,_%D0%A1%D1%82%D0%B0%D0%BD%D0%B0#cite_note-5">[5]</a></sup>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><iframe frameborder="0" height="450" scrolling="yes" src="https://www.youtube.com/embed/6ETlkiB7yKc" width="800"></iframe></p>', '2015-09-15', 1, 'Стана Катич', 4, '<p><img alt="" src="/upload/stana-katic-1.jpg" style="float:left; height:63px; margin-left:10px; margin-right:10px; width:100px" /><strong>Стана Катич<sup>[1]</sup></strong>&nbsp;(англ.&nbsp;<em>Stana Katic: /ˈstɑːnə ˈk&aelig;tɨk/</em>&nbsp;; род.&nbsp;26 апреля&nbsp;1978,&nbsp;Гамильтон,&nbsp;Онтарио,&nbsp;Канада)&nbsp;&mdash; канадская актриса&nbsp;сербско-хорватского&nbsp;происхождения, наиболее известная по роли детектива Кейт Беккет в телесериале &laquo;Касл&raquo;.&nbsp;</p>', 1, 0),
(6, '<p><img alt="" src="/upload/puaro.jpg" style="float:left; height:133px; margin-left:10px; margin-right:10px; width:200px" /><span style="font-size:48px"><strong>Сериал снимался с&nbsp;<a href="https://ru.wikipedia.org/wiki/1989_%D0%B3%D0%BE%D0%B4_%D0%B2_%D0%BA%D0%B8%D0%BD%D0%BE" title="1989 год в кино">1989</a>&nbsp;по совету дочери Агаты Кристи Розалинды Хикс. C 9 июня 2013 года на канале&nbsp;<a href="https://ru.wikipedia.org/wiki/ITV" title="ITV">ITV</a>, а также с 26 октября 2013 года на канале&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A2%D0%92%D0%A6" title="ТВЦ">ТВЦ</a>, стартовал заключительный, 13-й сезон, состоящий из 5 полуторачасовых фильмов.</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>&laquo;Пуаро́&raquo;</strong>&nbsp;(или&nbsp;&laquo;Пуаро́ <span style="color:#FF0000">Ага́ты Кри́сти&raquo;,&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%B8%D0%B9%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Английский язык"><span style="color:#FF0000">англ.</span></a><span style="color:#FF0000">&nbsp;Agatha Christie&#39;s Poirot,&nbsp;</span><a href="https://ru.wikipedia.org/wiki/1989_%D0%B3%D0%BE%D0%B4_%D0%B2_%D0%BA%D0%B8%D0%BD%D0%BE" title="1989 год в кино"><span style="color:#FF0000">1989</span></a><span style="color:#FF0000">&nbsp;&mdash;&nbsp;</span><a href="https://ru.wikipedia.org/wiki/2013_%D0%B3%D0%BE%D0%B4_%D0%B2_%D0%BA%D0%B8%D0%BD%D0%BE" title="2013 год в кино"><span style="color:#FF0000">2013</span></a><span style="color:#FF0000">)&nbsp;&mdash; британский детективный телесериал по произведениям&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%9A%D1%80%D0%B8%D1%81%D1%82%D0%B8,_%D0%90%D0%B3%D0%B0%D1%82%D0%B0" title="Кристи, Агата"><span style="color:#FF0000">Агаты Кристи</span></a><span style="color:#FF0000">&nbsp;о бельгийце&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%AD%D1%80%D0%BA%D1%8E%D0%BB%D1%8C_%D0%9F%D1%83%D0%B0%D1%80%D0%BE" title="Эркюль Пуаро"><span style="color:#FF0000">Эркюле Пуаро</span></a><span style="color:#FF0000">. Главную роль сыграл&nbsp;</span><a href="https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D1%88%D0%B5,_%D0%94%D1%8D%D0%B2%D0%B8%D0%B4" title="Суше, Дэвид"><span style="color:#FF0000">Дэвид Суше</span></a><span style="color:#FF0000">.</span></p>\r\n\r\n<p>&nbsp;</p>', '2015-09-15', 1, 'Пуаро Агаты Кристи', 4, NULL, 1, NULL),
(7, '<p><iframe align="middle" frameborder="0" height="500px" scrolling="no" src="https://www.youtube.com/embed/wsUQKw4ByVg" width="100%"></iframe></p>\r\n\r\n<p>Предположим что все продукты в приложении принадлежат единственной &ldquo;категории&rdquo;. В этом случае, необходим объект&nbsp;<tt>Category</tt>&nbsp;и способ связывания его с объектом&nbsp;<tt>Product</tt>. Начнём с соаздания сущности&nbsp;<tt>Category</tt>. Так как известно что в конечном счёте понадобится сохранить класс с помощью Doctrine, то можно позволить Doctrine создать его для вас.</p>\r\n\r\n<pre>\r\nphp app/console doctrine:generate:entity --entity=&quot;AcmeStoreBundle:Category&quot; --fields=&quot;name:string(255)&quot;\r\n</pre>\r\n\r\n<p>Это задание создаст сущность&nbsp;<tt>Category</tt>&nbsp;с полями&nbsp;<tt>id</tt>,&nbsp;<tt>name</tt>&nbsp;и связанными getter и setter функциями.</p>\r\n\r\n<h3>Метаданные отображения связей<a href="http://symfony-gu.ru/documentation/ru/html/book/doctrine.html#id12" title="Ссылка на этот заголовок">&para;</a></h3>\r\n\r\n<p>Чтобы связать сущности&nbsp;<tt>Category</tt>&nbsp;и&nbsp;<tt>Product</tt>, начните с создания свойства&nbsp;<tt>products</tt>&nbsp;в классе&nbsp;<tt>Category</tt>:</p>\r\n\r\n<pre>\r\n// src/Acme/StoreBundle/Entity/Category.php\r\n// ...\r\nuse Doctrine\\Common\\Collections\\ArrayCollection;\r\n\r\nclass Category\r\n{\r\n    // ...\r\n\r\n    /**\r\n     * @ORM\\OneToMany(targetEntity=&quot;Product&quot;, mappedBy=&quot;category&quot;)\r\n     */\r\n    protected $products;\r\n\r\n    public function __construct()\r\n    {\r\n        $this-&gt;products = new ArrayCollection();\r\n    }\r\n}</pre>\r\n\r\n<p>Во-первых, т. к. объект&nbsp;<tt>Category</tt>&nbsp;связан со множеством объектов&nbsp;<tt>Product</tt>, то добавленное свойство&nbsp;<tt>products</tt>&nbsp;будет массивом для хранения объектов<tt>Product</tt>. Далее, this isn&rsquo;t done because Doctrine needs it, but instead because it makes sense in the application for each&nbsp;<tt>Category</tt>&nbsp;to hold an array of&nbsp;<tt>Product</tt>objects.</p>\r\n\r\n<p>Код в методе&nbsp;<tt>__construct()</tt>&nbsp;важен, потому что Doctrine необходимо чтобы свойство&nbsp;<tt>$products</tt>&nbsp;было объектом&nbsp;<tt>ArrayCollection</tt>. Этот объект выглядит и работает почти&nbsp;<em>также</em>&nbsp;как массив, но имеет расширенную гибкость. Если это заставляет вас чувствовать неудобство, то не переживайте. Представьте что это просто&nbsp;<tt>массив</tt>&nbsp;и вы будете снова в хорошей форме.</p>', '2015-09-17', 1, 'Связи/объединения сущностей', 1, '<p><iframe align="left" frameborder="0" height="120" scrolling="no" src="https://www.youtube.com/embed/wsUQKw4ByVg" style="margin:10px" width="250"></iframe>Предположим что все продукты в приложении принадлежат единственной &ldquo;категории&rdquo;. В этом случае, необходим объект&nbsp;<tt>Category</tt>&nbsp;и способ связывания его с объектом&nbsp;<tt>Product</tt>. Начнём с соаздания сущности&nbsp;<tt>Category</tt>. Так как известно что в конечном счёте понадобится сохранить класс с помощью Doctrine, то можно позволить Doctrine создать его для вас.</p>', 1, NULL),
(8, '<p><strong>CKEditor</strong>&nbsp;&mdash;&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%B2%D0%BE%D0%B1%D0%BE%D0%B4%D0%BD%D0%BE%D0%B5_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%BD%D0%BE%D0%B5_%D0%BE%D0%B1%D0%B5%D1%81%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5" title="Свободное программное обеспечение">свободный</a>&nbsp;<a href="https://ru.wikipedia.org/wiki/WYSIWYG" title="WYSIWYG">WYSIWYG</a>-<a href="https://ru.wikipedia.org/wiki/%D0%A2%D0%B5%D0%BA%D1%81%D1%82%D0%BE%D0%B2%D1%8B%D0%B9_%D1%80%D0%B5%D0%B4%D0%B0%D0%BA%D1%82%D0%BE%D1%80" title="Текстовый редактор">редактор</a>, который может быть использован на веб-страницах.</p>\r\n\r\n<p>До версии 3.0 назывался&nbsp;<strong>FCKeditor</strong>&nbsp;(&laquo;FCK&raquo; от имени создателя редактора, Frederico Caldeira Knabben), но сменил имя чтобы не ассоциироваться с распространённым в английском языке ругательством (при старте проекта бразилец Фредерико об этом не знал).</p>\r\n\r\n<p>Особенностью редактора является малый размер без необходимости инсталляции на стороне клиента.</p>\r\n\r\n<p>Редактор интегрирован с:</p>\r\n\r\n<ul>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/ASP.Net" title="ASP.Net">ASP.Net</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Active_Server_Pages" title="Active Server Pages">ASP</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/ColdFusion" title="ColdFusion">ColdFusion</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/PHP" title="PHP">PHP</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Java" title="Java">Java</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/JavaScript" title="JavaScript">JavaScript</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/w/index.php?title=Active-FoxPro&amp;action=edit&amp;redlink=1" title="Active-FoxPro (страница отсутствует)">Active-FoxPro</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/w/index.php?title=Lasso&amp;action=edit&amp;redlink=1" title="Lasso (страница отсутствует)">Lasso</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Perl" title="Perl">Perl</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Python" title="Python">Python</a></li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Ruby" title="Ruby">Ruby</a></li>\r\n</ul>\r\n\r\n<p>CKeditor совместим с большинством современных&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%91%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80" title="Браузер">браузеров</a>:</p>\r\n\r\n<ul>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Opera" title="Opera">Opera</a>&nbsp;9.50+</li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Safari" title="Safari">Safari</a>&nbsp;3.0+</li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Firefox" title="Firefox">Firefox</a>&nbsp;1.5+</li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Camino" title="Camino">Camino</a>&nbsp;1.0+ (Mac)</li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Internet_Explorer" title="Internet Explorer">Internet Explorer</a>&nbsp;5.5+</li>\r\n\t<li><a href="https://ru.wikipedia.org/wiki/Google_Chrome" title="Google Chrome">Google Chrome</a></li>\r\n</ul>\r\n\r\n<p>Редактор также интегрирован с&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0_%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F_%D0%B2%D0%B5%D0%B1-%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D0%BC%D1%8B%D0%BC" title="Система управления веб-содержимым">системами управления содержимым</a>, например:&nbsp;<a href="https://ru.wikipedia.org/wiki/Drupal" title="Drupal">Drupal</a><sup><a href="https://ru.wikipedia.org/wiki/CKeditor#cite_note-1">[1]</a></sup>,&nbsp;<a href="https://ru.wikipedia.org/wiki/Plone" title="Plone">Plone</a><sup><a href="https://ru.wikipedia.org/wiki/CKeditor#cite_note-2">[2]</a></sup>,&nbsp;<a href="https://ru.wikipedia.org/wiki/MediaWiki" title="MediaWiki">MediaWiki</a><sup><a href="https://ru.wikipedia.org/wiki/CKeditor#cite_note-3">[3]</a></sup>.</p>\r\n\r\n<p>На официальном сайте имеется возможность ознакомиться с демоверсией продукта,&nbsp;<a href="http://ckeditor.com/demo" rel="nofollow">в режиме онлайн</a>.</p>', '2015-09-17', 1, 'CKEditor', 3, '<p>CKEditor&nbsp;&mdash;&nbsp;свободный&nbsp;WYSIWYG-редактор, который может быть использован на веб-страницах.</p>\r\n\r\n<p>До версии 3.0 назывался&nbsp;FCKeditor&nbsp;(&laquo;FCK&raquo; от имени создателя редактора, Frederico Caldeira Knabben), но сменил имя чтобы не ассоциироваться с распространённым в английском языке ругательством (при старте проекта бразилец Фредерико об этом не знал).</p>', 1, NULL),
(9, '<div class="row ">\r\n<div class="span5 ">\r\n<div class="banner-wrap style-2">\r\n<p><a href="#" title="Че вылупился"><img alt="" src="/blog/upload/images/Menu/banner-img1.jpg" title="Че вылупился" /></a></p>\r\n\r\n<div class="desc">\r\n<div class="desc-inner">\r\n<h5><a href="#" title="Че вылупился">Че вылупился</a></h5>\r\n\r\n<p><a href="#" title="Че вылупился">Предьявите билеты</a></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="span5 ">\r\n<div class="banner-wrap style-2">\r\n<p><a href="#" title="Что то он косо посмотрел надо валить"><img alt="" src="/blog/upload/images/Menu/banner-img2.jpg" title="Хватай сумку и бежим" /> </a></p>\r\n\r\n<div class="desc">\r\n<div class="desc-inner">\r\n<h5><a href="#" title="Что то он косо посмотрел надо валить">Что то он косо посмотрел надо валить</a></h5>\r\n\r\n<p><a href="#" title="Что то он косо посмотрел надо валить">Хватай сумку и бежим</a></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="row ">\r\n<div class="span5 ">\r\n<div class="banner-wrap style-2">\r\n<p><a href="#" title="Что то жопа дымит у вас не будет стаканчика пива"><img alt="" src="/blog/upload/images/Menu/banner-img3.jpg" title="Что то жопа дымит у вас не будет стаканчика пива" /> </a></p>\r\n\r\n<div class="desc">\r\n<div class="desc-inner">\r\n<h5><a href="#" title="Что то жопа дымит у вас не будет стаканчика пива">Что то жопа дымит, у вас не будет стаканчика пива</a></h5>\r\n\r\n<p><a href="#" title="Что то жопа дымит у вас не будет стаканчика пива">Ну или газировки хотябы</a></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="span5 ">\r\n<div class="banner-wrap style-2">\r\n<p><a href="#" title="Тихо а то ун увидит"><img alt="" src="/blog/upload/images/Menu/banner-img4.jpg" title="Тихо а то ун увидит" /> </a></p>\r\n\r\n<div class="desc">\r\n<div class="desc-inner">\r\n<h5><a href="#" title="Тихо а то ун увидит">Тихо а то он увидит</a></h5>\r\n\r\n<p><a href="#" title="Тихо а то ун увидит">что на мне нет бельишка</a></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p><iframe align="middle" frameborder="0" height="450" scrolling="no" src="https://www.youtube.com/embed/Rgox84KE7iY" width="100%"></iframe></p>\r\n\r\n<p>&nbsp;</p>', '2015-09-17', 1, 'Разделы', 1, '<p>A lightweight image gallery modal window script which uses only CSS3 for silky-smooth animations and transitions, utilizes GPU rending, which can be completely controlled and themed directly from the CSS.</p>\r\n\r\n<ul>\r\n\t<li>Lightweight!&nbsp;<code>jquery.photobox.js</code>&nbsp;is only 5kb (gziped &amp; minified)</li>\r\n\t<li>Hardware accelerated, CSS3 transitions and animations</li>\r\n\t<li>Mobile friendly</li>\r\n\t<li>Support videos via iframe embedding</li>\r\n\t<li>Stunning UI and user-friendly UX</li>\r\n\t<li>Images &amp; videos can be zoomed using mousewheel</li>\r\n\t<li>Thumbnails can be zoomed using mousewheel</li>\r\n\t<li>Keyboard &amp; mouse navigation. Even using mousewheel left/right ;-)</li>\r\n\t<li>Exposed UX control up to 99%. No need to mess with the source code</li>\r\n\t<li>Observes DOM changes (if images were added/removed)</li>\r\n\t<li>Event-delegation on all thumbnails events (obviously...)</li>\r\n\t<li>HTML5 History support: update location with the currently viewed image</li>\r\n\t<li>No images at all! The only image is a pre-loader animation for old IE.</li>\r\n\t<li>Browsers support: IE8+ (graceful degradation), Modern browsers</li>\r\n</ul>', 0, 1),
(10, '<div id="lightgallery"><a href="/blog/upload/images/Menu/banner-img1.jpg"><img alt="" src="/blog/upload/images/Menu/banner-img1.jpg" style="height:200px; width:470px" /></a><a href="/blog/upload/images/Menu/banner-img2.jpg"><img alt="" src="/blog/upload/images/Menu/banner-img2.jpg" style="height:200px; width:470px" /></a><a href="/blog/upload/images/Menu/banner-img4.jpg"><img alt="" src="/blog/upload/images/Menu/banner-img4.jpg" style="height:200px; width:470px" /></a></div>', '2015-09-17', 1, 'галерея', 1, NULL, 0, NULL),
(11, '<div id="lightgallery"><a href="/blog/upload/images/Slider/slides1-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides1-970x414.jpg" style="height:85px; width:200px" /></a><a href="/blog/upload/images/Slider/slides2-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides2-970x414.jpg" style="height:85px; width:200px" /></a><a href="/blog/upload/images/Slider/slides3-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides3-970x414.jpg" style="height:85px; width:200px" /></a></div>', '2015-09-17', 1, 'Еще одна галерея', 1, NULL, 0, NULL),
(12, '<div id="lightgallery"><a href="/blog/upload/images/Slider/slides1-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides1-970x414.jpg" style="height:85px; width:200px" /></a><a href="/blog/upload/images/Slider/slides2-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides2-970x414.jpg" style="height:85px; width:200px" /></a><a href="/blog/upload/images/Slider/slides3-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides3-970x414.jpg" style="height:85px; width:200px" /></a></div>', '2015-09-17', 1, 'галерея 3', 2, NULL, 0, 0),
(13, '<div id="lightgallery"><a href="/blog/upload/images/Slider/slides1-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides1-970x414.jpg" style="height:85px; width:200px" /></a><a href="/blog/upload/images/Slider/slides2-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides2-970x414.jpg" style="height:85px; width:200px" /></a><a href="/blog/upload/images/Slider/slides3-970x414.jpg"><img alt="" src="/blog/upload/images/Slider/slides3-970x414.jpg" style="height:85px; width:200px" /></a></div>', '2015-09-17', 1, 'Галерея 4', 4, NULL, 0, NULL);

-- 
-- Вывод данных для таблицы category
--
INSERT INTO category VALUES
(1, 'Услуги', 'В даноом разделе публикуются все услуги оказываемые нашей командой.', 0),
(2, 'Портфолио', '<p>В данном разделе мы собираем отчеты обо всех проведенных мероприятиях</p>', 0),
(3, 'Каталог программ', '<p>&nbsp;В этом разделе все наши программы на выбор и комбинацию</p>', 0),
(4, 'Блог', '<p>В этои разделе мы ведем свой блог</p>', 0),
(5, 'Тестовый Раздел', '<p>Тут ничего нет</p>', 3),
(6, 'Корпоративы', '<p>Тут что то о корпоративах</p>', 1),
(7, 'Свадьбы', '<p>что то о свадьбах</p>', 4),
(18, 'Заполнитель', '<p>Заполнитель</p>', 1),
(19, 'Заполнитель', '<p>Заполнитель</p>', 1),
(20, 'Заполнитель', '<p>Заполнитель</p>', 1),
(21, 'Заполнитель', '<p>Заполнитель</p>', 1),
(22, 'Заполнитель', '<p>Заполнитель</p>', 1),
(23, 'Заполнитель', '<p>Заполнитель</p>', 1);

-- 
-- Вывод данных для таблицы fos_user
--
INSERT INTO fos_user VALUES
(1, 'gordondalos', 'gordondalos', 'gordondalos@gmail.com', 'gordondalos@gmail.com', 1, 'sov7nv9vqn4go88w0wkcgkw48sck8o4', '$2y$13$sov7nv9vqn4go88w0wkcgef24BWXm/75fmjFlZH1wBoojeFdJKH7C', '2015-09-18 13:11:36', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

-- 
-- Вывод данных для таблицы slider
--
INSERT INTO slider VALUES
(1, 'http:\\\\google.com', '/blog/upload/images/Slider/slides3-970x414.jpg', 'Просто скрипка'),
(2, 'http:\\\\mail.ru', '/blog/upload/images/Slider/slides1-970x414.jpg', 'Какой-нибуть текст'),
(4, 'http://127.0.0.1/blog/web/post/5', '/blog/upload/images/Slider/slides2-970x414.jpg', 'Стана катич'),
(5, 'http:\\\\mail.ru', '/blog/upload/images/Slider/slides1-970x414.jpg', 'Привет мир');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;