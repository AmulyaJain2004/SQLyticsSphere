# MongoDB Tutorial by Code With Harry 

## My Revision Notes

## Best Friend: MongoDB Documentation

### Setup

#### 1. Download MongoDB Community Server and Compass
MongoDB Atlas: The fully managed service for MongoDB deployments in the cloud
MongoDB Enterprise: The subscription-based, self-managed version of MongoDB
MongoDB Community: The source-available, free-to-use, and self-managed version of MongoDB

---

#### 2. Local Instance of MongoDB

- cd C:/Users/hp/
- mkdir db
- cd "C:/Program Files/MongoDB/Server/8.0/bin/"
- run mongod --dbpath /Users/hp/db
It will run MongoDB CLI instance on your local device 
Next open MongoDBCompass GUI based application to interact with MongoDB Server on your local machine
- Add a new connection
- URI : mongodb://localhost:27017
- Save and Connect

---

### Main

#### 1. Create a Database 

- Click on + Create database
- Add Database Name: employees
- Add Collection Name: managers 
- Click on Create Database button

Relational DB -> NoSQL DB MongoDB
database -> database
table -> collection
row -> document
column -> field

#### 2. Commands

To show databases
```
show dbs 
```

To use particular database
```
use employees 
```

CRUD operations
C - Create 
R - Read 
U - Update 
D - Delete

Create(C) -> Insert
Method -> Description
db.collection.insertOne() -> Inserts a single document into a collection.
db.collection.insertMany() -> Inserts multiple documents into a collection.

To insert one document (record)
```
db.inventory.insertOne(
{item: "canvas", qty: 100, tags: ["cotton"], size: { h: 28, w: 35.5, uom: "cm"}}
)
```