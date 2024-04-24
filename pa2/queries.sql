-- find trails by difficulty for a user's favorited and completed trails
SELECT 
    u.name AS user_name,
    t.name AS trail_name,
    td.status AS trail_status,
    d.name AS difficulty_level
FROM user_trails td
JOIN users u ON td.user_id = u.id
JOIN trails t ON td.trail_id = t.id
JOIN trail_difficulty tf ON t.id = tf.trail_id
JOIN difficulties d ON tf.difficulty_id = d.id
WHERE u.id = 1
AND d.name = 'Easy'
ORDER BY td.status, d.name;
-- find trails by difficulty for a user's favorited and completed trails
SELECT 
    u.name AS user_name,
    t.name AS trail_name,
    td.status AS trail_status,
    d.name AS difficulty_level
FROM user_trails td
JOIN users u ON td.user_id = u.id
JOIN trails t ON td.trail_id = t.id
JOIN trail_difficulty tf ON t.id = tf.trail_id
JOIN difficulties d ON tf.difficulty_id = d.id
WHERE u.id = 1
AND d.name = 'Easy'
ORDER BY td.status, d.name;

-- find all users who completed trails of a specific difficulty
SELECT DISTINCT u.id, u.name, u.email
FROM users u
JOIN user_trails ut ON u.id = ut.user_id
JOIN trail_difficulty td ON ut.trail_id = td.trail_id
JOIN difficulties d ON td.difficulty_id = d.id
WHERE ut.status = 'completed'
AND d.name = 'Hard';

-- find top 3 trails that are commented on the most frequently by the top 3 most active reviewers
-- who the top 3 most active reviewers are based on the total count of their reviews
SELECT 
    t.id AS trail_id, 
    t.name AS trail_name,
    l.name AS location_name,
    COUNT(DISTINCT r.user_id) AS number_of_unique_reviewers, -- Count unique reviewers
    COUNT(r.id) AS total_reviews -- Count total reviews
FROM 
    trails t
JOIN 
    reviews r ON t.id = r.trail_id
JOIN 
    locations l ON t.location_id = l.id
JOIN 
    (
        SELECT 
            user_id
        FROM 
            reviews
        GROUP BY 
            user_id
        ORDER BY 
            COUNT(id) DESC
        LIMIT 3
    ) AS top_reviewers ON r.user_id = top_reviewers.user_id
GROUP BY 
    t.id
ORDER BY 
    COUNT(r.id) DESC
LIMIT 3;
