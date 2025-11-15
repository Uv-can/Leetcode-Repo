-- Write your PostgreSQL query statement below

-- Select all users whose email matches the valid email pattern
SELECT 
    user_id,
    name,
    mail
FROM Users
WHERE 
    -- Check that the email starts with a letter, followed by allowed characters in the prefix,
    -- and ends with the exact domain '@leetcode.com'
    mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';
