
create table a (aid int);
create table b (bid int);
create table c (cid int);
create index idx_a on a (aid);
create index idx_b on b (bid);
create index idx_c on c (cid);

create view v as
       select *
       from a, b
       where aid = bid;
