drop table if exists main_table_old_model;
create table main_table_old_model(
    id                       SERIAL,
    property_one      text NULL,
    property_two       int NULL,
    property_three     boolean NULL,
    CONSTRAINT main_table_old_model_pkey PRIMARY KEY (id)
);

insert into main_table_old_model
(property_one, property_two, property_three)
values('1:name_first_property_one:2022-01-01', 1, true);
insert into main_table_old_model
(property_one, property_two, property_three)
values('2:name_second_property_one:2022-01-02', 2, false); 

alter table main_table_old_model
add column id_property_one int8 NULL;
alter table main_table_old_model
add column name_property_one text NULL;
alter table main_table_old_model
add column date_property_one timestamp NULL;

update main_table_old_model t
set
(id_property_one, name_property_one, date_property_one) =
(select 
    property_one_array[1]::int8 as id_property_one,
    property_one_array[2]::text as name_property_one,
    property_one_array[3]::timestamp as date_property_one
    from(
        select 
            regexp_split_to_array(property_one, E'\\:') as property_one_array
    ) as split_property_one 
    where t.id = id);

alter table main_table_old_model
drop column property_one;

alter table main_table_old_model
rename to main_table_new_model; 
alter table main_table_new_model
rename constraint main_table_old_model_pkey to main_table_new_model_pkey; 