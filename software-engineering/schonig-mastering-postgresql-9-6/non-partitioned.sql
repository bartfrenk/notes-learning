
drop table stats;

create table stats (
  adset_id integer not null,
  hour integer not null,
  views integer not null,
  primary key (adset_id, hour, views)
);

insert into stats (adset_id, hour, views)
select 1, s, s % 100
from generate_series(1, 10000000) s;
