-- Top rated trails, now grouping by trail ID instead of name
SELECT 
    trails.id AS TrailID, 
    AVG(ratings.score) AS AvgRating,
    COUNT(ratings.score) AS NumberOfRatings
FROM trails
JOIN ratings ON trails.id = ratings.trail_id
GROUP BY trails.id
HAVING COUNT(ratings.score) > 1 -- trails rated more than once
ORDER BY AVG(ratings.score) DESC, COUNT(ratings.score) DESC
LIMIT 3;

-- Detailed review for trails with a specific name
SELECT 
    t.id AS TrailID,
    t.name AS TrailName, 
    u.name AS UserName, 
    r.title AS ReviewTitle, 
    r.content, 
    r.review_date
FROM reviews r
JOIN users u ON r.user_id = u.id
JOIN (
    SELECT id, name FROM trails WHERE name = 'Hoverla Ascent'
) AS t ON r.trail_id = t.id
ORDER BY r.review_date DESC
LIMIT 5;

-- Trails with specific characteristics
SELECT 
    trails.name AS TrailName,
    trails.length,
    trails.elevation,
    locations.name AS Location,
    difficulties.name AS Difficulties
FROM 
    trails
JOIN 
    locations ON trails.location_id = locations.id
JOIN 
    difficulties ON trails.difficulties_id = difficulties.id
WHERE 
    trails.length > 10 AND trails.elevation BETWEEN 100 AND 2000
ORDER BY 
    trails.elevation DESC, trails.length DESC;

-- Top rated trails by difficulty, grouping by trail ID
SELECT 
    difficulties.name AS Difficulties,
    trails.name AS Trail,
    AVG(ratings.score) AS AverageRating
FROM 
    trails
JOIN 
    difficulties ON trails.difficulties_id = difficulties.id
JOIN 
    ratings ON trails.id = ratings.trail_id
GROUP BY 
    difficulties.id, trails.id
HAVING 
    AVG(ratings.score) > 4
ORDER BY 
    Difficulties, AverageRating DESC;
