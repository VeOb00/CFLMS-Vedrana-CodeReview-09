drop DATABASE cr09_vedrana_delivery;
CREATE DATABASE cr09_vedrana_delivery DEFAULT CHARACTER SET utf8;

use cr09_vedrana_delivery;

CREATE TABLE countries(
    ID int not null auto_increment,
    country varchar(150),
    country_code varchar(2),
    primary key(ID)
);

CREATE TABLE cities_places(
    ID int not null auto_increment,
    city_place varchar(150),
    country_ID int not null,
    primary key(ID),
    foreign key(country_ID) references countries(ID)
);

CREATE TABLE zip_codes(
    ID int not null auto_increment,
    zip_code int not null,
    city_place_ID int not null,
    primary key(ID),
    foreign key(city_place_ID) references cities_places(ID)
);

CREATE TABLE addresses(
    ID int not null auto_increment,
    street_name_and_number varchar(250),
    zip_code_ID int not null,
    primary key(ID),
    foreign key(zip_code_ID) references zip_codes(ID)
);

CREATE TABLE post_offices(
    ID int not null auto_increment,
    address_ID int not null,
    primary key(ID),
    foreign key(address_ID) references addresses(ID)
);

CREATE TABLE pickup_locations(
    ID int not null auto_increment,
    address_ID int not null,
    post_office_ID int not null,
    primary key(ID),
    foreign key(address_ID) references addresses(ID),
    foreign key(post_office_ID) references post_offices(ID)
);

CREATE TABLE employees_positions(
    ID int not null auto_increment,
    position varchar(250),
    primary key(ID)
);

CREATE TABLE employees(
    ID int not null auto_increment,
    first_name varchar(150),
    last_name varchar(150),
    position_ID int not null,
    primary key(ID),
    foreign key(position_ID) references employees_positions(ID)
);

CREATE TABLE customers(
    ID int not null auto_increment,
    first_name varchar(150),
    last_name varchar(150),
    address_ID int not null,
    primary key(ID),
    foreign key(address_ID) references addresses(ID)
);

CREATE TABLE package_attributes(
    ID int not null auto_increment,
    height_mm int not null,
    width_mm int not null,
    length_mm int not null,
    package_weight_kg decimal(7, 3),
    primary key(ID)
);

CREATE TABLE packages(
    ID int not null auto_increment,
    package_attributes_ID int not null,
    package_sender int not null,
    package_reciever int not null,
    delivery_price_euro decimal(6, 2),
    primary key(ID),
    foreign key(package_attributes_ID) references package_attributes(ID),
    foreign key(package_sender) references customers(ID),
    foreign key(package_reciever) references customers(ID)
);

CREATE TABLE package_entries(
    ID int not null auto_increment,
    entry_date date,
    package_ID int not null,
    pickup_location_ID int not null,
    employee_processing_ID int not null,
    primary key(ID),
    foreign key(package_ID) references packages(ID),
    foreign key(pickup_location_ID) references pickup_locations(ID),
    foreign key(employee_processing_ID) references employees(ID)
);

CREATE TABLE deliveries(
    ID int not null auto_increment,
    delivery_start_time datetime,
    delivery_end_time datetime,
    delivery_status varchar(250),
    package_entry_ID int not null,
    employee_delivering_ID int not null,
    primary key(ID),
    foreign key(package_entry_ID) references package_entries(ID),
    foreign key(employee_delivering_ID) references employees(ID)
);
