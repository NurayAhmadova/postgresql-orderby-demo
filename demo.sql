-- QUERY 1:

-- percentile_disc(0.5) calculates the exact value at the 50th percentile (i.e., the median) within a group.
-- WITHIN GROUP (ORDER BY monthly_poops): specifies how the values are ordered within the group, based on the monthly_poops column.
-- GROUP BY color: groups the results by the cat's color.
SELECT color,
       percentile_disc(0.5) WITHIN GROUP (ORDER BY monthly_poops)
FROM cats
GROUP BY color;

-- QUERY 2:

-- WITHIN GROUP (ORDER BY monthly_meals): specifies how the values are ordered within the group, based on the monthly_meals column.
SELECT color,
       percentile_disc(0.5) WITHIN GROUP (ORDER BY monthly_meals)
FROM cats
GROUP BY color;

-- QUERY 3:

-- GROUP BY ROLLUP (color): The ROLLUP function creates subtotals and a grand total for the groups. In this case, it will:
-- Compute the median monthly_poops for each distinct color of cat.
-- Generate an additional row representing the overall median across all colors (the grand total).
SELECT color,
       percentile_disc(0.5) WITHIN GROUP (ORDER BY monthly_poops)
FROM cats
GROUP BY ROLLUP (color);

-- QUERY 4:

-- percentile_disc(0.67) WITHIN GROUP (ORDER BY monthly_poops): This returns the 67th percentile using discrete percentile calculation. The result is a specific value from the dataset — the value at or immediately above the 67th percentile position.
-- percentile_cont(0.67) WITHIN GROUP (ORDER BY monthly_poops): This returns the 67th percentile using continuous percentile calculation. The result is a value that could be interpolated between two values in the dataset if the exact percentile position doesn’t exist in the ordered data.
SELECT percentile_disc(0.67) WITHIN GROUP (ORDER BY monthly_poops),
       percentile_cont(0.67) WITHIN GROUP (ORDER BY monthly_poops)
FROM cats;

-- QUERY 5:

-- SELECT monthly_poops, count(*): This part selects two columns:
-- monthly_poops: The number of times an orange cat poops in a month.
-- count(*): The total count of orange cats that have the same monthly poop count.
-- GROUP BY monthly_poops: This groups the results by the monthly_poops value. Each group corresponds to a distinct value of monthly_poops, allowing the count of cats for each poop count.
-- ORDER BY monthly_poops DESC: This orders the results by the column monthly_poops in descending order, so the highest monthly poop counts appear first.
-- LIMIT 4: This restricts the output to the top 4 results, meaning you will see only the four highest monthly_poops counts among orange cats.
SELECT monthly_poops, count(*)
FROM cats
WHERE color = 'orange'
GROUP BY monthly_poops
ORDER BY monthly_poops DESC
LIMIT 4;

-- QUERY 6:

SELECT monthly_meals, count(*)
FROM cats
WHERE color = 'multicolored'
GROUP BY monthly_meals
ORDER BY monthly_meals -- ASC by default
LIMIT 10;

-- QUERY 7:

-- mode() WITHIN GROUP (ORDER BY color):
-- The mode() function finds the most frequent value in a dataset. In this case, it calculates the mode for the color column, which means it will return the most frequent color in the cats table.
-- WITHIN GROUP (ORDER BY color) is required syntax for the mode() function. It tells the query to consider the color column to find the most common value.
SELECT mode() WITHIN GROUP (ORDER BY color)
FROM cats;
