// بسم الله الرحمن الرحيم

// db.dropDatabase();
// use train_station_db;
// show dbs; 
// show collections;

/**
    Tables or Collections:
        - Trains
        - Train_Status
        - Passanger
        - Ticket 
 */

// CREATE TABLES OR COLLECTION IN  MONGODB:
db.createCollection('Trains'); // => create table Trains; // db.Trains.drop();           // => drop table Trains;
db.createCollection('Train_Status');
db.createCollection('Passanger');
db.createCollection('Ticket');

// ADD OR INSERT DATA INTO [Trains] TABLE:
db.Trains.insertOne( { _id:"T001", Fare:10.00, Source:"Ruwi", Destination:"Seeb", Weekdays_available:"Sunday" } );
db.Trains.insertOne( { _id:"T002", Fare:10.00, Source:"Seeb", Destination:"Ruwi", Weekdays_available:"Monday" } );

// ADD OR INSERT DATA INTO [Train_Status] TABLE:
db.Train_Status.insertOne( {Seats_available: 8 , seats_booked: 12} );
db.Train_Status.insertOne( {Seats_available: 7 , seats_booked: 13} );
db.Train_Status.insertOne( {Seats_available: 9 , seats_booked: 11} );
db.Train_Status.insertOne( {Seats_available: 10, seats_booked: 10} );
db.Train_Status.insertOne( {Seats_available: 11, seats_booked: 9 } );
db.Train_Status.insertOne( {Seats_available: 12, seats_booked: 8 } );
db.Train_Status.insertOne( {Seats_available: 13, seats_booked: 7 } );
db.Train_Status.insertOne( {Seats_available: 14, seats_booked: 6 } );
db.Train_Status.insertOne( {Seats_available: 15, seats_booked: 5 } );


// ADD OR INSERT DATA INTO [Passanger] TABLE:
db.Passanger.insertOne( {Passanger_ID: 123, Passanger_name: "Ali"     , Passenger_address: "Bosher"   , Passanger_gender: "Male"  } );
db.Passanger.insertOne( {Passanger_ID: 124, Passanger_name: "Haneen"  , Passenger_address: "Alkhuwair", Passanger_gender: "Female"} );
db.Passanger.insertOne( {Passanger_ID: 125, Passanger_name: "Said"    , Passenger_address: "Bosher"   , Passanger_gender: "Male"  } );
db.Passanger.insertOne( {Passanger_ID: 126, Passanger_name: "Muhamamd", Passenger_address: "Alkhud"   , Passanger_gender: "Male"  } );
db.Passanger.insertOne( {Passanger_ID: 127, Passanger_name: "Khalfan" , Passenger_address: "Azaiba"   , Passanger_gender: "Female"} );
db.Passanger.insertOne( {Passanger_ID: 128, Passanger_name: "yaqdan"  , Passenger_address: "Azaiba"   , Passanger_gender: "Male"  } );
db.Passanger.insertOne( {Passanger_ID: 129, Passanger_name: "Ammar"   , Passenger_address: "Al Amerat", Passanger_gender: "Male"  } );
db.Passanger.insertOne( {Passanger_ID: 130, Passanger_name: "Yahya"   , Passenger_address: "Alkhuwair", Passanger_gender: "Male"  } );
db.Passanger.insertOne( {Passanger_ID: 131, Passanger_name: "Rahma"   , Passenger_address: "Alkhuwair", Passanger_gender: "Male"  } );


// ADD OR INSERT DATA INTO [Ticket] TABLE:
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 89, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T002", Ticket_ID: 90, Ticket_Status: "Not Confirm"} );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 91, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 92, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 93, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 94, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 95, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 96, Ticket_Status: "Confirm"    } );
db.Ticket.insertOne( {Train_ID:"T001", Ticket_ID: 97, Ticket_Status: "Not Confirm"} );


/** ------------------------------------
    --- NOW LETS SOLVE QUISTIONS: ------
    ------------------------------------
 */




// [1] => An example SQL statement of building a database table.
db.createCollection('Trains');

// [2] => An example SQL statement of populating a database table with values.
db.Train_Status.insertOne( {Seats_available: 15, Seats_booked: 5 } );

// [3] => An SQL query to retrieve available trains for a particular date.
db.Trains.find({Weekdays_available: "Sunday"}, {_id:0, Fare:0, Source:0, Destination:0, Weekdays_available:0}).pretty();

// [4] => An SQL query to retrieve the train detail such as status of the availability of the tickets on specific date.
db.Trains.aggregate([
    { $lookup: {
        from: "Ticket",
        localField: "_id",
        foreignField: "Train_ID",
        as: "Status" 
    }},
    { 
        $unwind: '$Status'
    },
    {$project: {
        _id: 0,
        Fare: 0,
        Source: 0,
        Destination:0
    }}
]);
// [5] => An SQL query to retrieve the average price of all tickets sold.
db.Trains.aggregate([{$group: {_id:"T001", sum_val:{$sum:"$Fare"}}}])
// [6] => An SQL query to retrieve the overall number of tickets sold for a particular date.
db.Trains.aggregate([{ $lookup: { from: "Ticket", localField: "_id", foreignField: "Train_ID", as: "Status" }}]);


// Model, implement and query a selected NoSQL database
// Model the data to a NoSQL data model (key-value, xml or graph) to implement the selected database type/product & pipe or import the data. 
// You must re-create query ‘3’ in Task 3 to verify your implementation
// Use:Mongo DB databases
// Compare and contrast the SQL and Non-SQL solution
