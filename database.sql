create table employees (
   id bigint constraint pk_employees primary key,
   first_name varchar(256),
   last_name varchar(512),
   birthdate date
);

create table roles (
   id bigint constraint pk_roles primary key,
   title varchar(256)
);

create table employees_roles (
   employee_id bigint references employees(id),
   role_id bigint references roles(id),
   started_on date,
   constraint pk_employees_roles primary key (employee_id, role_id)
);

insert into employees
(id, first_name, last_name, birthdate)
values
(1, 'Marcin', 'Golenia', '2000-10-10'),
(2, 'Adam', 'Golenia', '2001-11-11'),
(3, 'Brian', 'Joel', '1990-09-05'),
(4, 'Jane', 'Austin', '2000-05-05'),
(5, 'Tina', 'Travol', '1999-01-12'),
(6, 'Ralph', 'Smith', '1977-09-05');

insert into roles
(id, title)
values
(1, 'Software Engineer'),
(2, 'Product Manager'),
(3, 'Team Leader');

insert into employees_roles
(employee_id, role_id, started_on)
values
(1, 1, '2021-02-02'),
(2, 1, '2021-02-02'),
(3, 1, '2021-02-02'),
(4, 1, '2021-02-02'),
(5, 1, '2021-02-02'),
(5, 2, '2021-02-02'),
(6, 2, '2021-02-02');

create table employees_json (
   id bigint constraint pk_employees_json primary key,
   data jsonb not null
);

insert into employees_json
(id, data)
values
(1, '{"id": 1, "first_name":"Marcin", "last_name": "Golenia", "birthdate": "2012-03-19T00:00Z", "roles": [{"started_on":"2002-02-11T00:00Z", "title": "Product Manager"}]}'::jsonb),
(2, '{"id": 2, "first_name":"Ted", "last_name": "Drawgo", "birthdate": "2002-02-11T00:00Z", "roles": [{"started_on":"2002-02-11T00:00Z", "title": "Software Engineer"}]}'::jsonb)