/* EXO REQUETE SQL

                    Exercice 1 :

Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
de façon décroissante sur la durée de réalisation

SELECT r.recipe_name, r.preparation_time, c.category_name 
FROM recipe r
INNER JOIN category c ON r.id_category = c.id_category
ORDER BY r.preparation_time DESC

*************************************************************************************
                    Exercice 2 : 

En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

SELECT r.recipe_name, r.preparation_time, c.category_name, COUNT(ri.id_ingredient) AS nbIngredients
FROM category c
INNER JOIN recipe r ON r.id_category = c.id_category
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
GROUP BY r.recipe_name, r.preparation_time, c.category_name
ORDER BY r.preparation_time

*************************************************************************************
                    Exercice 3 :

Afficher les recettes qui nécessitent au moins 30 min de préparation

SELECT r.recipe_name, r.preparation_time
FROM recipe r
WHERE preparation_time > '30'
ORDER BY r.preparation_time

*************************************************************************************
                    Exercice 4 : 
Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
question)

SELECT r.recipe_name
FROM recipe r
WHERE r.recipe_name LIKE '%Salade%'

*************************************************************************************
                    Exercice 5 :

Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
pouvoir lister les détails de cette recettes (ingrédients)

INSERT INTO recipe VALUES ('11','Pâtes à la carbonara','20','Faites revenir les lardons dans une poêle bien chaude 
sans matière grasse jusquà ce quils soient bien cuits, et réservez.
Faites cuire les spaghetti dans une grande casserole deau bouillante salée en suivant les instructions sur lemballage.
Pendant ce temps, dans un saladier, fouettez les oeufs avec le sel et le poivre, et ajoutez le parmesan râpé.
Lorsque les pâtes sont cuites, égouttez-les et mélangez avec la préparation aux oeufs. 
Ajoutez les lardons et servez les spaghetti carbonara aussitôt avec un peu de parmesan râpé par-dessus.','2')

*************************************************************************************
                    Exercice 6 : 

Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre 
convenance)

UPDATE recipe
SET recipe_name = 'quiquiche saumon poireau'
WHERE id_recipe = 3

*************************************************************************************
                    Exercice 7 : 

Supprimer la recette n°2 de la base de données

DELETE FROM recipe_ingredients ri
WHERE ri.id_recipe = 2;
DELETE FROM recipe r
WHERE r.id_recipe = 2;

*************************************************************************************
                    Exercice 8 :

Afficher le prix total de la recette n°5 :

SELECT ri.id_recipe, ROUND(SUM(ri.quantity * i.price),2) AS prix_total
FROM recipe_ingredients ri
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE id_recipe = 5
GROUP BY ri.id_recipe

*************************************************************************************
                    Exercice 9 : 

Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix) :

SELECT i.ingredient_name, ri.quantity, i.unity, i.price, (ri.quantity * i.price) AS prix 
FROM recipe_ingredients ri 
JOIN ingredient i ON ri.id_ingredient = i.id_ingredient 
WHERE ri.id_recipe = 5

*************************************************************************************
                    Exercice 10 : 

Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 € :

INSERT INTO ingredient VALUES ('52','Poivre','cac','2.5')

*************************************************************************************
                    Exercice 11 : 

Modifier le prix de l’ingrédient n°12 (prix à votre convenance):

UPDATE ingredient
SET price = '5'
WHERE id_ingredient = 12

*************************************************************************************
                    Exercice 12 : 

Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

SELECT c.category_name, COUNT(r.id_category) AS nbRecette
FROM category c
inner JOIN recipe r ON c.id_category = r.id_category
GROUP BY c.category_name


*************************************************************************************
                    Exercice 13 

Afficher les recettes qui contiennent l’ingrédient « Oeuf » :

SELECT r.recipe_name 
FROM recipe r 
JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe 
JOIN ingredient i ON ri.id_ingredient = i.id_ingredient 
WHERE i.id_ingredient = 2

*************************************************************************************
                    Exercice 14 

Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes 

UPDATE recipe r
SET r.preparation_time = r.preparation_time + 5

*************************************************************************************
                    Exercice 15 

Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure

SELECT r.recipe_name
FROM recipe r
WHERE recipe_name NOT IN (SELECT r.recipe_name
FROM recipe r
INNER JOIN recipe_ingredients ri ON ri.id_recipe = r.id_recipe
INNER JOIN ingredient i ON i.id_ingredient = ri.id_ingredient
WHERE i.price > 2)

*************************************************************************************
                    Exercice 16  

Afficher la / les recette(s) les plus rapides à préparer

SELECT r.recipe_name 
FROM recipe r
WHERE preparation_time = (SELECT MIN(preparation_time) 
FROM recipe r)

*************************************************************************************
                    Exercice 17 

Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
chaude qui consiste à verser de l’eau chaude dans une tasse)

SELECT r.recipe_name
FROM recipe r 
LEFT JOIN recipe_ingredients ri ON ri.id_recipe = r.id_recipe
WHERE id_ingredient IS null

*************************************************************************************
                    Exercice 18 : 

Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

SELECT i.ingredient_name
FROM ingredient i
INNER JOIN recipe_ingredients ri ON ri.id_ingredient = i.id_ingredient
GROUP BY i.ingredient_name
HAVING COUNT(ri.id_ingredient) >= 3

OU ( plus conventionnel)

SELECT i.ingredient_name,COUNT(ri.id_ingredient) AS nbIngredient
FROM ingredient i
INNER JOIN recipe_ingredients ri ON ri.id_ingredient = i.id_ingredient
GROUP BY i.ingredient_name
HAVING nbIngredient >= 3

*************************************************************************************
                    Exercice 19 :  

Ajouter un nouvel ingrédient à une recette spécifique :

INSERT INTO recipe_ingredients VALUES ('1','2','1')

*************************************************************************************
                    Exercice 20 : 

Trouver la recette la plus coûteuse de la base de données 
(il peut y avoir des ex aequo, il est donc exclu d’utiliser la clause LIMIT

SELECT r.recipe_name, ROUND(SUM(ri.quantity * i.price),2)AS prix
FROM recipe r
JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe 
JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY r.id_recipe
HAVING ROUND(SUM(ri.quantity * i.price), 2) >= all (SELECT ROUND(SUM(ri.quantity * i.price), 2)
FROM recipe r
JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY r.id_recipe)

