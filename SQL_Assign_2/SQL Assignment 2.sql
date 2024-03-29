---Customer Table creation
create table customer_table(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

---Items Table creation
create table items_table(
	UPC SERIAL primary key,
	item_name VARCHAR(100),
	quantity INTEGER,
	item_cost NUMERIC(10,2)
);


---Concessions Table creation
create table concessions_table(
	concession_order_id SERIAL primary key,
	customer_id INTEGER not null,
	order_date TIME,
	number_of_items INTEGER,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	UPC INTEGER not null,
	foreign key (customer_id) references customer_table(customer_id),
	foreign key (UPC) references items_table(UPC)
);

---Movie Table creation
create table movie_table(
	movie_id SERIAL primary key,
	movie_name VARCHAR(700),
	theater_number INTEGER
);

---Tickets Table creation
create table ticket_order(
	order_id SERIAL primary key,
	order_date TIME,
	number_of_tickets INTEGER,
	customer_id INTEGER not null,
	movie_id INTEGER not null,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	foreign key (customer_id) references customer_table(customer_id),
	foreign key (movie_id) references movie_table(movie_id)
);

---Insert into Customer Table
insert into customer_table(customer_id, first_name, last_name)
VALUES(1, 'Sharon', 'Stone');

insert into customer_table(customer_id, first_name, last_name)
VALUES(2, 'Adam', 'Devine');

insert into customer_table(customer_id, first_name, last_name)
VALUES(3, 'Sarah Michelle', 'Gellar');


---Insert into Items Table
insert into items_table(UPC, item_name, quantity, item_cost)
VALUES(111, 'Lays Chili Lime', 2, 5.65);

insert into items_table(UPC, item_name, quantity, item_cost)
VALUES(222, 'Medium Popcorn', 1, 6.89);

insert into items_table(UPC, item_name, quantity, item_cost)
VALUES(333, 'Cadbury Milk Chocolate', 1, 1.75);


---Insert into Concessions Table
insert into concessions_table(concession_order_id, customer_id, order_date, number_of_items, sub_total, total_cost, UPC)
VALUES(1,2, now(), 2, 2*5.65, 12.50, 111);

insert into concessions_table(concession_order_id, customer_id, order_date, number_of_items, sub_total, total_cost, UPC)
VALUES(2,1, now(), 1, 1*6.89, 7.50, 222);

insert into concessions_table(concession_order_id, customer_id, order_date, number_of_items, sub_total, total_cost, UPC)
VALUES(3,3, now(), 1, 1*1.75, 2.50, 333);


---Insert into Movie Table
insert into movie_table(movie_id, movie_name, theater_number)
VALUES(02789, 'Dune 2', 4);

insert into movie_table(movie_id, movie_name, theater_number)
VALUES(09878, 'Wonka', 1);

insert into movie_table(movie_id, movie_name, theater_number)
VALUES(67890, 'Little Women', 8);


---Insert into Tickets Table
insert into ticket_order(order_id, order_date, number_of_tickets, customer_id, movie_id, sub_total, total_cost)
VALUES(1012, now(), 4, 3, 02789, 4*10.50, 48.50);

insert into ticket_order(order_id, order_date, number_of_tickets, customer_id, movie_id, sub_total, total_cost)
VALUES(0192, now(), 1, 1, 09878, 1*10.50, 12.50);

insert into ticket_order(order_id, order_date, number_of_tickets, customer_id, movie_id, sub_total, total_cost)
VALUES(1230, now(), 6, 2, 67890, 6*10.50, 71.50);


