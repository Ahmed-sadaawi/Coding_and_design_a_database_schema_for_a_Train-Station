-- بسم الله الرحمن الرحيم

-- NOTE: ALL SQL QUERIES WORKS WELL ON MYSQL;

-- REMOVE THE OLD DB:
DROP DATABASE `train_station_db`;
-- Create a new database
CREATE DATABASE `train_station_db`;
USE `train_station_db`;

CREATE TABLE `Trains` (
    `Train_NO` VARCHAR(25) PRIMARY KEY NOT NULL,
    `Fare` FLOAT NOT NULL,
    `Source` CHAR(40) NOT NULL,
    `Destination` CHAR(40) NOT NULL,
    `Weekdays_available` VARCHAR(255) NOT NULL
);
-- ADD VALUES TO TRAINS TABLE:
INSERT INTO `Trains` (Train_NO, Fare, Source, Destination, Weekdays_available) VALUES ("T001",	10.00,  "Ruwi",	"Seeb",	"Sunday");
INSERT INTO `Trains` (Train_NO, Fare, Source, Destination, Weekdays_available) VALUES ("T002",	10.00,  "Seeb",	"Ruwi",	"Monday");
    
CREATE TABLE `Train_Status` (
    `Seats_available` INT NOT NULL,
	`seats_booked` INT NOT NULL,
    `Train_NO` VARCHAR(25) NOT NULL
);
ALTER TABLE `Train_Status` ADD FOREIGN KEY (Train_NO) REFERENCES Trains(Train_NO);

-- ADD VALUES TO Train_Status TABLE:
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (8 ,  12, "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (7 ,  13, "T002");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (9 ,  11, "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (10,  10, "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (11,  9 , "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (12,  8 , "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (13,  7 , "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (14,  6 , "T001");
INSERT INTO `Train_Status` (Seats_available, seats_booked, Train_NO) VALUES (15,  5 , "T001");

CREATE TABLE `Passanger` (
    `Passanger_ID` INT UNSIGNED NOT NULL PRIMARY KEY,
	`Passanger_name` VARCHAR(50) NOT NULL,
	`Passenger_address` VARCHAR(40) NOT NULL,
	`Passanger_gender` ENUM("Male","Female")
);
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(123,	"Ali"       , 	"Bosher"	 ,      "Male"    );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(124,	"Haneen"    , 	"Alkhuwair"  ,	    "Female"  );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(125,	"Said"      , 	"Bosher"	 ,      "Male"    );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(126,	"Muhamamd"  ,   "Alkhud"	 ,      "Male"    );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(127,	"Khalfan"   , 	"Azaiba"	 ,      "Female"  );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(128,	"yaqdan"    , 	"Azaiba"	 ,      "Male"    );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(129,	"Ammar"     , 	"Al Amerat"  ,	    "Male"    );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(130,	"Yahya"     , 	"Alkhuwair"  ,	    "Male"    );
INSERT INTO `Passanger` (Passanger_ID, Passanger_name, Passenger_address, Passanger_gender) VALUES(131,	"Rahma"     ,  	"Alkhuwair"  ,	    "Male"    );

CREATE TABLE `Ticket` (
    `Ticket_ID` INT UNSIGNED NOT NULL PRIMARY KEY,
	`Ticket_Status` ENUM("Confirm","Not Confirm"),
    `Train_NO` VARCHAR(25) NOT NULL,
    `Passanger_ID` INT UNSIGNED NOT NULL,
    `Passanger_Passanger_ID` INT UNSIGNED NOT NULL,
    INDEX `Train_NO` (`Train_NO` ASC) VISIBLE,
    INDEX `fk_Ticket_Passanger1_idx` (`Passanger_Passanger_ID` ASC) VISIBLE,
    CONSTRAINT `ticket_ibfk_1`
        FOREIGN KEY (`Train_NO`)
        REFERENCES `train_station_db`.`Trains` (`Train_NO`),
    CONSTRAINT `fk_Ticket_Passanger1`
        FOREIGN KEY (`Passanger_Passanger_ID`)
        REFERENCES `train_station_db`.`Passanger` (`Passanger_ID`)
);

INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (89,	"Confirm"    , "T001", 123, 123);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (90,	"Not Confirm", "T002", 124, 124);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (91,	"Confirm"    , "T001", 125, 125);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (92,	"Confirm"    , "T001", 126, 126);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (93,	"Confirm"    , "T001", 127, 127);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (94,	"Confirm"    , "T001", 128, 128);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (95,	"Confirm"    , "T001", 129, 129);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (96,	"Confirm"    , "T001", 130, 130);
INSERT INTO `Ticket` (Ticket_ID, Ticket_Status, Train_NO, Passanger_ID, Passanger_Passanger_ID) VALUES (97,	"Not Confirm", "T001", 131, 131);
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------



--- NOW LETS SOLVE QUISTIONS: ------
------------------------------------

-- 1- An example SQL statement of building a database table ("This Table doesn't work... It's for example only"):
CREATE TABLE `Trains` (
    `Train_NO` VARCHAR(25) PRIMARY KEY NOT NULL,
    `Fare` FLOAT NOT NULL,
    `Source` CHAR(40) NOT NULL,
    `Destination` CHAR(40) NOT NULL,
    `Weekdays_available` VARCHAR(255) NOT NULL
);


-- 2- An example SQL statement of populating a database table with values ("This Table doesn't work... It's for example only")
INSERT INTO `Trains` (Train_NO, Fare, Source, Destination, Weekdays_available) VALUES ("T002",	10.00,  "Seeb",	"Ruwi",	"Monday");



-- 3- An SQL query to retrieve available trains for a particular date
select Trains.Train_NO, Train_Status.Seats_available
from Trains, Train_Status
where Train_Status.Train_NO=Trains.Train_NO and Train_Status.Seats_available!=0;
-- +----------+-----------------+
-- | Train_NO | Seats_available |
-- +----------+-----------------+
-- | T001     |               8 |
-- | T001     |               9 |
-- | T001     |              10 |
-- | T001     |              11 |
-- | T001     |              12 |
-- | T001     |              13 |
-- | T001     |              14 |
-- | T001     |              15 |
-- | T002     |               7 |
-- +----------+-----------------+



-- 4- An SQL query to retrieve the train detail such as status of the availability of the tickets on specific date.
SELECT Weekdays_available, Ticket_Status
from Trains, Ticket
WHERE Ticket.Train_NO=Trains.Train_NO and Ticket.Ticket_Status="Not Confirm" and trains.Weekdays_available="Sunday";
-- OUTPUT DESGIN:
-- +--------------------+---------------+
-- | Weekdays_available | Ticket_Status |
-- +--------------------+---------------+
-- | Sunday             | Not Confirm   |
-- +--------------------+---------------+



----------------------------------------------------------------------
-- 5- An SQL query to retrieve the average price of all tickets sold.

select sum(trains.fare), ticket.ticket_status 
from trains, ticket 
where Ticket.Train_NO=trains.Train_NO and ticket.ticket_status="Confirm";

-- OUTPUT DESGIN:
-- +------------------+---------------+
-- | sum(trains.fare) | ticket_status |
-- +------------------+---------------+
-- |               70 | Confirm       |
-- +------------------+---------------+



----------------------------------------------------------------------------------
-- 6- An SQL query to retrieve the overall number of tickets sold for a particular date.

SELECT Ticket.Ticket_ID, trains.Weekdays_available
FROM Trains, Ticket
Where Ticket.Train_NO=trains.Train_NO AND Ticket.ticket_status="Confirm" AND Trains.Weekdays_available="Sunday";

-- OUTPUT DESGIN:
-- +-----------+--------------------+
-- | Ticket_ID | Weekdays_available |
-- +-----------+--------------------+
-- |        89 | Sunday             |
-- |        91 | Sunday             |
-- |        92 | Sunday             |
-- |        93 | Sunday             |
-- |        94 | Sunday             |
-- |        95 | Sunday             |
-- |        96 | Sunday             |
-- +-----------+--------------------+



----------------------------------------------------------------