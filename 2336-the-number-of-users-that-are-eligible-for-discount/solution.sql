CREATE OR REPLACE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT AS $$
BEGIN
  RETURN (
	  -- Write your PostgreSQL query statement below.
      select  count(distinct user_id)
      from purchases 
      where amount >= minAmount and time_stamp between startDate and endDate 
  );
END;
$$ LANGUAGE plpgsql;




