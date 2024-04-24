-- Creating a view to combine trail details, location information, difficulty levels, and average ratings
CREATE VIEW trail_details AS

-- Selecting columns for the view
SELECT 
    trails.id AS trail_id, -- Unique identifier for the trail
    trails.name AS trail_name, -- Name of the trail
    trails.length, -- Length of the trail
    trails.elevation, -- Elevation gain of the trail
    trails.description AS trail_description, -- Description of the trail
    trails.image_url AS trail_image_url, -- URL of the trail image
    locations.name AS location_name, -- Name of the location where the trail is located
    locations.country, -- Country where the trail is located
    locations.region, -- Region within the country
    difficulties.name AS difficulty, -- Difficulty level of the trail
    AVG(ratings.score) AS avg_rating -- Average rating of the trail

-- Joining tables to fetch related information
FROM 
    trails -- Main table containing trail information
INNER JOIN locations ON trails.location_id = locations.id -- Joining with locations table to get location details
INNER JOIN trail_difficulty ON trails.id = trail_difficulty.trail_id -- Joining with trail_difficulty table to get difficulty levels
INNER JOIN difficulties ON trail_difficulty.difficulty_id = difficulties.id -- Joining with difficulties table to get difficulty names
LEFT JOIN ratings ON trails.id = ratings.trail_id -- Left join with ratings table to get average rating

-- Grouping the results by trail ID and other relevant columns
GROUP BY 
    trails.id, trails.name, trails.length, trails.elevation, trails.description, trails.image_url,
    locations.name, locations.country, locations.region, difficulties.name;

SELECT * FROM trail_details;
