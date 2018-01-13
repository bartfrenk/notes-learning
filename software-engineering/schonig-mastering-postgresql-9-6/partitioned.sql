drop table p_stats cascade;

create table p_stats (
  adset_id integer not null,
  hour integer not null,
  views integer not null,
  primary key (adset_id, hour, views)
);


create table p_stats_0 () inherits (p_stats);
create table p_stats_1 () inherits (p_stats);
create table p_stats_2 () inherits (p_stats);
create table p_stats_3 () inherits (p_stats);
create table p_stats_4 () inherits (p_stats);
create table p_stats_5 () inherits (p_stats);
create table p_stats_6 () inherits (p_stats);
create table p_stats_7 () inherits (p_stats);
create table p_stats_8 () inherits (p_stats);
create table p_stats_9 () inherits (p_stats);


alter table p_stats_0 add check (hour < 1000000);
alter table p_stats_1 add check (hour >= 1000000 and hour < 2000000);
alter table p_stats_2 add check (hour >= 2000000 and hour < 3000000);
alter table p_stats_3 add check (hour >= 3000000 and hour < 4000000);
alter table p_stats_4 add check (hour >= 4000000 and hour < 5000000);
alter table p_stats_5 add check (hour >= 5000000 and hour < 6000000);
alter table p_stats_6 add check (hour >= 6000000 and hour < 7000000);
alter table p_stats_7 add check (hour >= 7000000 and hour < 8000000);
alter table p_stats_8 add check (hour >= 8000000 and hour < 9000000);
alter table p_stats_9 add check (hour >= 9000000 and hour < 10000000);


insert into p_stats_0 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(0, 999999) s;

insert into p_stats_1 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(1000000, 1999999) s;


insert into p_stats_2 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(2000000, 2999999) s;


insert into p_stats_3 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(3000000, 3999999) s;


insert into p_stats_4 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(4000000, 4999999) s;


insert into p_stats_5 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(5000000, 5999999) s;


insert into p_stats_6 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(6000000, 6999999) s;


insert into p_stats_7 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(7000000, 7999999) s;


insert into p_stats_8 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(8000000, 8999999) s;


insert into p_stats_9 (adset_id, hour, views)
select 1, s, s % 100
from generate_series(9000000, 9999999) s;




