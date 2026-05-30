-- Write your PostgreSQL query statement below


SELECT
    ROUND(
        COALESCE(
            NULLIF(
                (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) AS unique_accepts) * 1.0 /
                NULLIF((SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) AS unique_requests), 0),
                0
            ),
            0
        ),
        2
    ) AS accept_rate;
