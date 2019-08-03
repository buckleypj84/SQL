drop table IF EXISTS pewlett.employees; 

--truncate table pewlett.employees; 

CREATE INDEX EmpnoPK on pewlett.employees ("emp_no")

Create Index "PersonFK" on "Person" ("CityId")


create table IF NOT EXISTS pewlett.employees (
	 emp_no serial not null primary key
	,birth_date date not null
	,first_name varchar(50) not null
	,last_name varchar(50) not null
	,gender char(1) not null
	,hire_date date not null
);
select * from pewlett.employees;

drop table IF EXISTS pewlett.depts; 

create table IF NOT EXISTS pewlett.depts (
	 dept_no char(4) not null primary key
	,dept_name varchar(50) not null
);

CREATE INDEX deptnoPK on pewlett.depts ("dept_no")

select * from pewlett.depts;

drop table IF EXISTS pewlett.depts_employees

create table IF NOT EXISTS pewlett.depts_employees(
	 emp_no int not null references pewlett.employees(emp_no)
	,dept_no char(4) not null references pewlett.depts(dept_no)
	,from_date date not null
	,to_date date not null
);

select * from pewlett.depts_employees;

drop table IF EXISTS pewlett.salaries

create table IF NOT EXISTS pewlett.salaries(
	 emp_no int not null references pewlett.employees(emp_no)
	,salary int not null
	,from_date date not null
	,to_date date not null
);

select * from pewlett.salaries;

CREATE INDEX empnoPK on pewlett.salaries ("emp_no")



drop table pewlett.titles;

create table pewlett.titles(
	 emp_no int not null references pewlett.employees(emp_no)
	,title varchar(60) not null
	,from_date date not null
	,to_date date not null
);

select * from pewlett.titles;


