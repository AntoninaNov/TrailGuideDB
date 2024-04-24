-- = with Non-Correlated Subqueries
-- Selects trails that have an exact average rating score of 4
SELECT name FROM trails
WHERE id = (
    SELECT trail_id FROM ratings
    GROUP BY trail_id
    HAVING AVG(score) = 4
);
-- Updates the description of difficulties that have trails with an exact average rating of 4
UPDATE difficulties
SET description = 'Perfect balance of challenge and enjoyment.'
WHERE id = (
    SELECT difficulty_id FROM ratings
    JOIN trails ON ratings.trail_id = trails.id
    GROUP BY difficulty_id
    HAVING AVG(score) = 4
);
-- Deletes ratings for trails that have an exact average score of 4
DELETE FROM ratings
WHERE trail_id IN (
    SELECT trail_id FROM ratings
    GROUP BY trail_id
    HAVING AVG(score) = 4
);

-- IN with Non-Correlated Subqueries
-- Selects users who have rated any 'Hard' difficulty trails
SELECT name FROM users
WHERE id IN (
    SELECT user_id FROM ratings
    WHERE difficulty_id IN (SELECT id FROM difficulties WHERE name = 'Hard')
);
-- Updates profile types to 'pro' for users who have completed 'Hard' trails
UPDATE users
SET profile_type = 'pro'
WHERE id IN (
    SELECT user_id FROM user_trails
    WHERE status = 'completed' AND trail_id IN (
        SELECT trail_id FROM trail_difficulty
        WHERE difficulty_id IN (SELECT id FROM difficulties WHERE name = 'Hard')
    )
);
-- Deletes reviews for trails categorized as 'Easy'
DELETE FROM reviews
WHERE trail_id IN (
    SELECT trail_id FROM trail_difficulty
    WHERE difficulty_id IN (SELECT id FROM difficulties WHERE name = 'Easy')
);

-- NOT IN with Non-Correlated Subqueries
-- Selects trails that have never been rated with a 'Hard' difficulty
SELECT name FROM trails
WHERE id NOT IN (
    SELECT trail_id FROM ratings
    WHERE difficulty_id IN (SELECT id FROM difficulties WHERE name = 'Hard')
);
-- Updates the length to 0 for trails not associated with 'Moderate' difficulty
UPDATE trails
SET length = 0
WHERE id NOT IN (
    SELECT trail_id FROM trail_difficulty
    WHERE difficulty_id IN (SELECT id FROM difficulties WHERE name = 'Moderate')
);
-- Deletes ratings for trails that haven't been favorited by any user
DELETE FROM ratings
WHERE trail_id NOT IN (
    SELECT trail_id FROM user_trails WHERE status = 'favorited'
);

-- EXISTS with Non-Correlated Subqueries
-- Selects trails that have been rated by at least one 'pro' user
SELECT t.name FROM trails t
WHERE EXISTS (
    SELECT 1 FROM ratings r
    JOIN users u ON r.user_id = u.id
    WHERE u.profile_type = 'pro' AND r.trail_id = t.id
);
-- Updates 'Easy' trails to 'Moderate' if they received a score of 5 from any user
UPDATE difficulties d
SET d.name = 'Moderate'
WHERE d.name = 'Easy' AND EXISTS (
    SELECT 1 FROM ratings r
    JOIN trail_difficulty td ON r.trail_id = td.trail_id
    WHERE td.difficulty_id = d.id AND r.score = 5
);
-- Deletes users who haven't submitted any reviews
DELETE FROM users
WHERE NOT EXISTS (
    SELECT 1 FROM reviews WHERE user_id = users.id
);

-- NOT EXISTS with Non-Correlated Subqueries
-- Selects users who haven't completed any trails
SELECT name FROM users
WHERE NOT EXISTS (
    SELECT 1 FROM user_trails ut
    WHERE ut.user_id = users.id AND ut.status = 'completed'
);
-- Sets the length of trails to 1 km if no user has rated them as 'Hard'
UPDATE trails
SET length = 1000
WHERE NOT EXISTS (
    SELECT 1 FROM ratings
    WHERE trail_id = trails.id AND difficulty_id = (
        SELECT id FROM difficulties WHERE name = 'Hard'
    )
);
-- Deletes difficulties not associated with any trails
DELETE FROM difficulties
WHERE NOT EXISTS (
    SELECT 1 FROM trail_difficulty WHERE difficulty_id = difficulties.id
);

-- = with Correlated Subqueries 
-- Selects the longest trail for each difficulty level
SELECT d.name AS difficulty, t.name, t.length 
FROM trails t
INNER JOIN trail_difficulty td ON t.id = td.trail_id
INNER JOIN difficulties d ON td.difficulty_id = d.id
WHERE t.length = (
    SELECT MAX(t2.length) 
    FROM trails t2
    INNER JOIN trail_difficulty td2 ON t2.id = td2.trail_id
    WHERE td2.difficulty_id = td.difficulty_id
)
GROUP BY d.name, t.name, t.length;
-- Increases the elevation of the most reviewed trail by 10%
UPDATE trails
SET elevation = elevation * 1.1
WHERE id = (
    SELECT trail_id FROM reviews
    GROUP BY trail_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
-- Deletes the trail that has exactly one review
DELETE FROM trails
WHERE id = (
    SELECT trail_id FROM reviews
    GROUP BY trail_id
    HAVING COUNT(id) = 1
    LIMIT 1
);

-- IN with Correlated Subqueries
-- Selects users who have rated trails located in 'Ukraine'
SELECT DISTINCT u.name 
FROM users u
WHERE u.id IN (
    SELECT r.user_id 
    FROM ratings r
    INNER JOIN trails t ON r.trail_id = t.id
    INNER JOIN locations l ON t.location_id = l.id
    WHERE l.country = 'Ukraine'
);
-- Sets all 'Easy' trails to 'Moderate' if favorited by 'pro' users
UPDATE difficulties
SET name = 'Moderate'
WHERE id IN (
    SELECT td.difficulty_id 
    FROM trail_difficulty td
    INNER JOIN user_trails ut ON td.trail_id = ut.trail_id
    INNER JOIN users u ON ut.user_id = u.id
    WHERE ut.status = 'favorited' AND u.profile_type = 'pro' AND td.difficulty_id IN (
        SELECT id FROM difficulties WHERE name = 'Easy'
    )
);
-- Deletes ratings for trails not rated by 'pro' users
DELETE FROM ratings
WHERE trail_id NOT IN (
    SELECT r.trail_id
    FROM ratings r
    JOIN users u ON r.user_id = u.id
    WHERE u.profile_type = 'pro'
);

-- NOT IN with Correlated Subqueries
-- Selects trails that have never been completed by any user
SELECT t.name 
FROM trails t
WHERE t.id NOT IN (
    SELECT ut.trail_id
    FROM user_trails ut
    WHERE ut.status = 'completed'
);
-- Marks trails as 'Inactive' if they have no difficulty level associated
UPDATE trails t
SET t.description = CONCAT(t.description, ' - Inactive')
WHERE t.id NOT IN (
    SELECT td.trail_id FROM trail_difficulty td
);
-- Deletes users who haven't favorited any trails
DELETE FROM users
WHERE id NOT IN (
    SELECT ut.user_id FROM user_trails ut WHERE ut.status = 'favorited'
);

-- EXISTS with Correlated Subqueries
-- Selects trails that have reviews from the current year
SELECT DISTINCT t.name 
FROM trails t
WHERE EXISTS (
    SELECT 1 FROM reviews r
    WHERE r.trail_id = t.id AND YEAR(r.review_date) = YEAR(CURDATE())
);
-- Marks trails as 'Highly Rated' if they have any rating of 5
UPDATE trails t
SET t.description = CONCAT(t.description, ' - Highly Rated')
WHERE EXISTS (
    SELECT 1 FROM ratings r WHERE r.trail_id = t.id AND r.score = 5
);
-- Deletes all trails that have never been favorited or completed
DELETE FROM trails
WHERE id NOT IN (
    SELECT trail_id FROM user_trails
);

-- NOT EXISTS with Correlated Subqueries
-- Selects 'noob' users who haven't rated any trails
SELECT name FROM users u
WHERE profile_type = 'noob' AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id
);
-- Sets elevation to 0 for all unrated trails
UPDATE trails t
SET t.elevation = 0
WHERE NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.trail_id = t.id
);
-- Deletes trails with no associated difficulty
DELETE FROM trails
WHERE id NOT IN (
    SELECT td.trail_id FROM trail_difficulty td
);

-- Finds all unique names of trails and difficulties
(SELECT name FROM trails)
UNION
(SELECT name FROM difficulties);

-- Lists all trail names followed by all difficulty names, including duplicates
(SELECT name FROM trails)
UNION ALL
(SELECT name FROM difficulties);

-- Find names that exist in both 'trails' and 'difficulties' tables
(SELECT name FROM trails)
INTERSECT
(SELECT name FROM difficulties);

-- Finds names in 'trails' that do not exist in 'difficulties'
(SELECT name FROM trails)       
EXCEPT                          
(SELECT name FROM difficulties);
