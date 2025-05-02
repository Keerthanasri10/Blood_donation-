create database blood_donation;
use blood_donation;
-- donor table
create table donor (
    donorid int primary key auto_increment ,
    name varchar(100) not null,
    age int,
    gender varchar(10),
    bloodgroup varchar(5),
    contactnumber varchar(15),
    address text,
    lastdonationdate date
);

-- recipient table
create table recipient (
    recipientid int primary key ,
    name varchar(100) not null,
    age int,
    gender varchar(10),
    bloodgroup varchar(5),
    contactnumber varchar(15),
    address text,
    requestdate date
);

-- hospital table
create table hospital (
    hospitalid int primary key ,
    name varchar(100) not null,
    location text,
    contactnumber varchar(15)
);

-- admin table
create table admin (
    adminid int primary key ,
    username varchar(50) unique not null,
    password varchar(100) not null
);

--  donation table
create table donation (
    donationid int primary key ,
    donorid int,
    hospitalid int,
    donationdate date,
    quantity int,
    foreign key (donorid) references donor(donorid) on delete cascade,
    foreign key (hospitalid) references hospital(hospitalid) on delete set null
);

-- bloodrequest table
create table bloodrequest (
    requestid int primary key ,
    recipientid int,
    hospitalid int,
    bloodgroup varchar(5),
    requestdate date,
    status enum('pending', 'approved', 'rejected'),
    foreign key (recipientid) references recipient(recipientid) on delete cascade,
    foreign key (hospitalid) references hospital(hospitalid) on delete set null
);