drop table IF EXISTS pewlett.empl; 

--truncate table pewlett.empl; 

create table IF NOT EXISTS pewlett.empl (
	 emp_no serial not null primary key
	,birth_date date not null
	,first_name varchar(50) not null
	,last_name varchar(50) not null
	,gender char(1) not null
	,hire_date date not null
);

CREATE INDEX EmpnoPK on pewlett.empl("emp_no")

select * from pewlett.empl;



