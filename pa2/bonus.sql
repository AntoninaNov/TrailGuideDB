-- Set up profiling to monitor performance
SET profiling = 1;

-- Create a clone of the trails table for testing purposes
CREATE TABLE trails_clone1 LIKE trails_clone;

-- Populate the clone table with data from the original trails_clone
INSERT INTO trails_clone1 SELECT * FROM trails_clone;

-- Check the number of records to ensure data consistency
SELECT COUNT(1) FROM trails_clone1;

-- Execute a query without an index
SELECT * FROM trails_clone1 WHERE name = 'Hoverla Ascent';

-- Show query profiles for analysis without index
SHOW PROFILES;

-- Create an index on the 'name' column to improve SELECT query performance
CREATE INDEX idx_name ON trails_clone1(name);

-- Execute the same query with an index
SELECT * FROM trails_clone1 WHERE name = 'Hoverla Ascent';

-- Show query profiles after index creation to compare performance
SHOW PROFILES;
