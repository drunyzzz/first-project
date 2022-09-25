/*
 В итоговой витрине несколько метрик представляли из себя количество событий разных типов над таблицей user_activity_log. Напишите SQL-запрос над этой таблицей, который вернёт 5 полей:

    client_id — идентификатор клиента;
    month — месяц данных (должен иметь тип date);
    visit_events — количество событий с типом visit за месяц;
    registration_events — количество событий с типом registration за месяц;
    login_events — количество событий с типом login за месяц. 
 
 */

select *
from user_activity_log;

select client_id, month, SUM(visit_events) as visit_events, SUM(registration_events) as registration_events, SUM(login_events) as login_events
from (
	select 	client_id,
			cast(date_trunc('month', hitdatetime) as DATE) as month,
			case 
				when action = 'visit' then 1 else 0
			end visit_events,
			case 
				when action = 'registration' then 1 else 0
			end registration_events,
			case 
				when action = 'login' then 1 else 0
			end login_events
	from user_activity_log) as t
group by client_id, month;

