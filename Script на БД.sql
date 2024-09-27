
-- Выведите все уникальные названия продуктов.
SELECT DISTINCT product_name 
FROM Products; 

-- Выведите id, название и стоимость продуктов с содержанием клетчатки (fiber) более 5 граммов.
SELECT product_id, product_name, price 
FROM Products 
JOIN Nutritional_Information ON Products.product_id = Nutritional_Information.product_id 
WHERE fiber > 5;

-- Выведите название продукта с самым высоким содержанием белка (protein).
SELECT product_name 
FROM Products 
JOIN Nutritional_Information ON Products.product_id = Nutritional_Information.product_id 
ORDER BY protein DESC 
LIMIT 1;

-- Подсчитайте общую сумму калорий для продуктов каждой категории, но не учитывайте продукты с нулевым жиром (fat = 0). Выведите id категории, сумму калорий.
SELECT Categories.category_id, SUM(Products.calories) AS total_calories 
FROM Products 
JOIN Categories ON Products.category_id = Categories.category_id 
JOIN Nutritional_Information ON Products.product_id = Nutritional_Information.product_id 
WHERE Nutritional_Information.fat > 0 
GROUP BY Categories.category_id;


-- Рассчитайте среднюю цену товаров каждой категории. Выведите название категории, среднюю цену.
SELECT Categories.category_name, AVG(Products.price) AS average_price 
FROM Products 
JOIN Categories ON Products.category_id = Categories.category_id 
GROUP BY Categories.category_name;

