select s.user_id 
, round(avg(case when c.action='confirmed'THEN 1.00
                 when s.time_stamp is null THEN 0.00
            ELSE 0
        END)  ,2) as confirmation_rate
from signups s
left join confirmations c on c.user_id =s.user_id
group by s.user_id
