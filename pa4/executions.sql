-- Example call for proc_calculate_difficulty_stats
CALL proc_calculate_difficulty_stats(1, @total_trails);
SELECT @total_trails AS 'Total Trails for Difficulty 1';

-- Example call for proc_update_trail_length with safe update
SET @length_example = 4500.00;
CALL proc_update_trail_length(@length_example);
SELECT @length_example AS 'Updated Length';

-- Transactional procedure call with different content lengths
SET @approval_status = '';
CALL proc_manage_review(1, 1, 'Great Trail', 'This is a good trail.', @approval_status);
SELECT @approval_status AS 'Approval Status';

SET @approval_status = '';
CALL proc_manage_review(1, 1, 'Amazing Experience', 'This trail provides an amazing experience with beautiful landscapes and challenging terrains.', @approval_status);
SELECT @approval_status AS 'Approval Status';
