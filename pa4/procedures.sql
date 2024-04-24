-- Procedure with IN and OUT parameters
-- Calculates the total number of trails for a given difficulty level.
-- 'difficulty_id_param' is the difficulty ID for which stats are calculated.
-- 'total_trails' is an OUT parameter that will hold the count of trails.
DELIMITER //
CREATE PROCEDURE proc_calculate_difficulty_stats(IN difficulty_id_param INT, OUT total_trails INT)
BEGIN
    SELECT COUNT(*) INTO total_trails
    FROM trail_difficulty
    WHERE difficulty_id = difficulty_id_param;
END //
DELIMITER ;

-- Procedure with INOUT parameter
-- Increases the length of trails that are shorter than 5000 meters by 10%.
-- It uses a temporary table to avoid MySQL error 1093 (can't specify target table for update in FROM clause).
DELIMITER //
CREATE PROCEDURE proc_update_trail_length(INOUT length_param DOUBLE) -- 
BEGIN
    CREATE TEMPORARY TABLE temp_trails (id INT);  -- Temporary table to store relevant trail IDs

    INSERT INTO temp_trails(id)
    SELECT id FROM trails WHERE length < 5000;  -- Populating temporary table with IDs of applicable trails

    UPDATE trails 
    SET length = length_param 
    WHERE id IN (SELECT id FROM temp_trails);  -- Using the temporary table to safely update the 'trails' table

    DROP TEMPORARY TABLE temp_trails;  -- Cleaning up by dropping the temporary table
END //
DELIMITER ;

-- Transactional procedure with conditional logic
-- Manages the insertion of a new review into the 'reviews' table.
-- It uses transactional control to commit or rollback the insert based on the length of the review content.
-- 'approval_status' is an INOUT parameter that returns the outcome of the operation.
DELIMITER //
CREATE PROCEDURE proc_manage_review(IN user_id_param INT, IN trail_id_param INT, IN title_param VARCHAR(100), IN content_param TEXT, INOUT approval_status VARCHAR(20))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  -- Handler to rollback transaction in case of any SQL error
    BEGIN
        ROLLBACK;  -- Rolling back the transaction on error
        SET approval_status = 'Failed';
    END;

    START TRANSACTION;
        INSERT INTO reviews(user_id, trail_id, title, content, review_date)
        VALUES (user_id_param, trail_id_param, title_param, content_param, CURDATE());
        
        -- Commit or rollback based on the length of the content.
        -- If content is longer than 50 characters, commit the transaction; otherwise, rollback.
        IF (CHAR_LENGTH(content_param) > 50) THEN
            COMMIT;  -- Committing the transaction if condition is met
            SET approval_status = 'Approved';  -- Setting status to 'Approved'
        ELSE
            ROLLBACK;  -- Rolling back the transaction if content is too short
            SET approval_status = 'Rejected - Content too short'; 
        END IF;
END //
DELIMITER ;
