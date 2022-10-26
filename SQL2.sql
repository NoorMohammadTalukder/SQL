/*Create a table called dept in the dbo schema. Specify the following
columns:
- dept_id INT
- dept_name VARCHAR(50)
Give the IDENTITY property to the dept_id column. Also, put a
primary key constraint on the dept_id column. Put a NOT NULL
constraint on the dept_name column.*/

create table dbo.dept
(
	dept_id int identity (1,1),
	dept_name varchar(50) not null,
	constraint pk_dept_id primary key (dept_id) 
);

/*insert a single row into the dbo.dept table*/

insert into dbo.dept (dept_name) values ('CSE');

select * from dbo.dept;


/*insert all department names from existing departments table*/

insert into dbo.dept (dept_name)
select department_name from hcm.departments; 

/*Create a table called emp in the dbo schema. Specify the following columns:
- emp_id INT
- first_name VARCHAR(50)
- last_name VARCHAR(50)
- hire_date DATE
- dept_id INT
Give the IDENTITY property to the emp_id column. Also, put a primary key
constraint on the emp_id column. Put NOT NULL constraints on any columns you
think need them. Put a foreign key constraint on the dept_id column which
references back to the dept_id column from the dbo.dept table.*/

create table dbo.emp
(
	emp_id INT identity,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	hire_date DATE,
	dept_id INT,

	constraint pk_emp_id primary key (emp_id),
	constraint fk_emp_dept_id foreign key (dept_id) references dbo.dept (dept_id)
);

/*Insert two employees to the dbo.emp table*/
insert into dbo.emp (first_name, last_name, hire_date, dept_id)
values  ('Scott', 'Davis', '20201211', 1),
		('Miriam', 'Yardley', '20201205', 1)

select * from dbo.emp;