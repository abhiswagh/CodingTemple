--Table Creation

--Customer Table Creation
create table customer_aw(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

--Car Table Creation
create table car_aw(
	serial_id SERIAL primary key,
	car_year NUMERIC(4),
	car_make VARCHAR(100),
	car_model VARCHAR(100),
	service_hist VARCHAR(500)
);

--Sales Staff Table Creation
create table sales_staff_aw(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

--Car Sale Table Creation
create table car_sales_aw(
	invoice_id SERIAL primary key,
	serial_id INTEGER not null,
	customer_id INTEGER not null,
	salesperson_id INTEGER not null,
	car_price NUMERIC(10,2),
	foreign key (serial_id)references car_aw(serial_id),
	foreign key (customer_id) references customer_aw(customer_id),
	foreign key (salesperson_id) references sales_staff_aw(salesperson_id)
);

--Repair Staff Table Creation
create table repair_staff_aw(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

--Parts Table Creation
create table parts_aw(
	part_id SERIAL primary key,
	serial_id INTEGER not null,
	part_name VARCHAR(100),
	part_price NUMERIC(10,2),
	foreign key (serial_id) references car_aw(serial_id)
);

--Service Repairs Table Creation
create table service_repairs_aw(
	service_id SERIAL primary key,
	customer_id INTEGER not null,
	serial_id INTEGER not null,
	part_id INTEGER, 
	service_name VARCHAR(100),
	service_price NUMERIC(10,2),
	foreign key (customer_id) references customer_aw(customer_id),
	foreign key (serial_id) references car_aw(serial_id),
	foreign key (part_id) references parts_aw(part_id)
);


---Inserting Data into Created Tables
create or replace function add_car(
	_serial_id INTEGER,
	_car_year NUMERIC(4),
	_car_make VARCHAR(100),
	_car_model VARCHAR(100),
	_service_hist VARCHAR(500)

)
returns void
language plpgsql 
as $$
begin
	insert into car_aw(
	serial_id,
	car_year,
	car_make,
	car_model,
	service_hist
	)VALUES(
	_serial_id,
	_car_year,
	_car_make,
	_car_model,
	_service_hist);
end;
$$

--Insert into Car Table
select add_car(358, 2013, 'Honda', 'Civic', 'oil change/filter replacement on 09/23/23');
select add_car(359, 2023, 'Subaru', 'Impreza', 'brakes changed on 02/01/24 and front wipers changed 02/28/24');
select add_car(360, 2024, 'Toyota', 'RAV4', null);
select add_car(361, 2021, 'Subaru', 'Forester', 'oil change on 08/25/23, tire rotation on 12/13/23');

create or replace function add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR(100),
	_last_name VARCHAR(100)
)
returns void
language plpgsql 
as $$
begin
	insert into customer_aw(
	customer_id,
	first_name,
	last_name
	)VALUES(
	_customer_id,
	_first_name,
	_last_name
	);
end;
$$

--Insert into Customer Table
select add_customer(512, 'Suzanne', 'Collins');
select add_customer(513, 'Kurt', 'Vonnegut');
select add_customer(514, 'Agatha', 'Christie');
select add_customer(515, 'Judy', 'Blume');


--Insert into Sales Staff Table
insert into sales_staff_aw(salesperson_id, first_name, last_name)
VALUES(1,'Zach', 'Braff');

insert into sales_staff_aw(salesperson_id, first_name, last_name)
VALUES(2,'Florence', 'Pugh');

--Insert into Car Sale Table
insert into car_sales_aw(invoice_id, serial_id, customer_id, salesperson_id, car_price)
VALUES(1287, 359, 512, 2, 25000);

insert into car_sales_aw(invoice_id, serial_id, customer_id, salesperson_id, car_price)
VALUES(1288, 360, 514, 1, 35000);

--Insert into Repair Staff Table
insert into repair_staff_aw(mechanic_id, first_name, last_name)
VALUES(34, 'Jonny', 'Smith');

insert into repair_staff_aw(mechanic_id, first_name, last_name)
VALUES(33, 'Matilda', 'Rogers');

--Insert into Parts Table
insert into parts_aw(part_id, serial_id, part_name, part_price)
VALUES(348709, 361, 'side-view mirror', 450);

insert into parts_aw(part_id, serial_id, part_name, part_price)
VALUES(983780, 361, 'stereo', 645);

--Insert into Service Repairs Table
insert into service_repairs_aw(service_id, customer_id, serial_id, part_id, service_name, service_price)
VALUES(98762, 513, 358, null, 'carburetor adjustment', 350);

insert into service_repairs_aw(service_id, customer_id, serial_id, part_id, service_name, service_price)
VALUES(98763, 515, 361, 348709, 'side-view mirror replacement', 689);

insert into service_repairs_aw(service_id, customer_id, serial_id, part_id, service_name, service_price)
VALUES(98764, 515, 361, 983780, 'stereo replacement', 802);










