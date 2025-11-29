CREATE OR REPLACE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT)
RETURNS TABLE (user_id INT) AS $$
BEGIN
  RETURN QUERY (
      -- Write your PostgreSQL query statement below.
      select  distinct p.user_id
      from purchases p
      where p.amount >= minAmount and p.time_stamp between startDate and endDate 
  );
END;
$$ LANGUAGE plpgsql;
