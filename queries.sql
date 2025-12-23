-- Initial Query
-- create database
create database vehicle_rental_management_db;

-- create users table
create table
  users (
    user_id serial primary key,
    name varchar(50) not null,
    email varchar(100) unique not null,
    password varchar(100) not null,
    phone varchar(20),
    role varchar(20) check (role in ('Admin', 'Customer')) default 'Customer'
  );

-- insert data into users table
insert into
  users (name, email, password, phone, role)
values
  ('Alice', 'alice@example.com', 'test-pass', '1234567890', 'Customer'),
  ('Bob', 'bob@example.com', 'test-pass', '0987654321', 'Admin'),
  ('Charlie', 'charlie@example.com', 'test-pass', '1122334455', 'Customer');

-- create vehicles table
create table
  vehicles (
    vehicle_id serial primary key,
    name varchar(50),
    type varchar(20)
      check (type in ('car', 'bike', 'truck')) not null,
    model varchar(50),
    registration_number varchar(50) unique not null,
    rental_price int not null,
    status varchar(20)
      check (status in ('available', 'rented', 'maintenance')) default 'available'
  );

-- insert data into vehicles table
insert into
  vehicles (name, type, model, registration_number, rental_price)
values
  ('Toyota Corolla', 'car', '2022', 'ABC-123', 50),
  ('Honda Civic', 'car', '2021', 'DEF-456', 60),
  ('Yamaha R15', 'bike', '2023', 'GHI-789', 30),
  ('Ford F-150', 'truck', '2020', 'JKL-012', 100);

-- create bookings table
create table
  bookings (
    booking_id serial primary key,
    user_id int not null,
    vehicle_id int not null,
    start_date date not null,
    end_date date not null,
    status varchar(20) 
      check (status in ('pending', 'confirmed', 'completed', 'cancelled')) default 'pending',
    total_cost int not null,
    constraint fk_user foreign key (user_id) references users (user_id),
    constraint fk_vehicle foreign key (vehicle_id) references vehicles (vehicle_id)
  );

-- insert data into bookings table
insert into
  bookings (user_id, vehicle_id, start_date, end_date, status, total_cost)
values
  (1, 1, '2025-12-01', '2025-12-05', 'pending', 200),
  (2, 3, '2025-12-10', '2025-12-12', 'pending', 60),
  (3, 2, '2025-12-15', '2025-12-17', 'pending', 120),
  (1, 4, '2025-12-20', '2025-12-22', 'pending', 200);

-- Query 1: Retrieve booking information with Customer name and Vehicle name
-- Concepts: INNER JOIN
select
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.status
from bookings b
  inner join users u on b.user_id = u.user_id
  inner join vehicles v on b.vehicle_id = v.vehicle_id;

-- Query 2: Find all vehicles that have never been booked
-- Concepts: NOT EXISTS
select *
from vehicles v
where not exists (
  select 1
  from bookings b
  where b.vehicle_id = v.vehicle_id
);

-- Query 3: Retrieve all available vehicles of a specific type (e.g., 'car')
-- Concepts: SELECT, WHERE
select *
from vehicles
where type = 'car'
and status = 'available';

-- Query 4: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings
-- Concepts: GROUP BY, HAVING, COUNT
select
  v.name,
  count(b.booking_id) as total_bookings
from
  vehicles v
  inner join bookings b on v.vehicle_id = b.vehicle_id
group by
  v.name
having
  count(b.booking_id) > 2;
