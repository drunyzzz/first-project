SELECT client_id,
       utm_campaign
FROM
  (SELECT *,
          ROW_NUMBER() OVER (PARTITION BY client_id
                             ORDER BY utm_campaign) row_num
   FROM user_attributes) t
WHERE row_num = 1;


SELECT client_id,
       phone
FROM
(SELECT *,
          ROW_NUMBER() OVER (PARTITION BY client_id
                             ORDER BY created_at desc) row_num
   FROM user_contacts uc) t
  where row_num = 1;