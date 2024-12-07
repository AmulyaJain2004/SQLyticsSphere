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

1. To show databases

```shell
show dbs 
```

2. To use particular database

```shell
use employees 
```

3. CRUD operations

- C - Create
- R - Read
- U - Update
- D - Delete

3.1. Create(C) -> Insert \
Method -> Description \
db.collection.insertOne() -> Inserts a single document into a collection.
db.collection.insertMany() -> Inserts multiple documents into a collection.

3.1.1. To insert one document (record)

```shell
db.inventory.insertOne(
    {item: "canvas", qty: 100, tags: ["cotton"], size: { h: 28, w: 35.5, uom: "cm"}}
)
```

Output

```shell
{
  acknowledged: true,
  insertedId: ObjectId('6754053aa99dc4d25fae6645')
}
```

If same item added multiple times, it will generate unique id everytime.

3.1.2. To insert many documents at once (records)

```shell
db.inventory.insertMany(
    [
        {item: "canvas1", qty: 70, tags: ["cotton"], size: { h: 8, w: 32, uom: "cm"}},
        {item: "canvas2", qty: 90, tags: ["copper"], size: { h: 48, w: 35.5, uom: "cm"}},
        {item: "canvas3", qty: 100, tags: ["zinc"], size: { h: 20, w: 35, uom: "cm"}},
        {item: "canvas4", qty: 200, tags: ["iron"], size: { h: 28, w: 37, uom: "cm"}},
        {item: "canvas5", qty: 20, tags: ["aluminium"], size: { h: 28, w: 50, uom: "cm"}}
    ]
)
```

Output

```shell
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('675407b9a99dc4d25fae6646'),
    '1': ObjectId('675407b9a99dc4d25fae6647'),
    '2': ObjectId('675407b9a99dc4d25fae6648'),
    '3': ObjectId('675407b9a99dc4d25fae6649'),
    '4': ObjectId('675407b9a99dc4d25fae664a')
  }
}
```

There are many important complex things also there will cover later.

3.2. Read(R) \
3.2.1 To fetch all documents

```shell
db.inventory.find()
```

or

```shell
db.inventory.find({})
```

Output

```shell
{
  _id: ObjectId('6754053aa99dc4d25fae6645'),
  item: 'canvas',
  qty: 100,
  tags: [
    'cotton'
  ],
  size: {
    h: 28,
    w: 35.5,
    uom: 'cm'
  }
}
{
  _id: ObjectId('675407b9a99dc4d25fae6646'),
  item: 'canvas1',
  qty: 70,
  tags: [
    'cotton'
  ],
  size: {
    h: 8,
    w: 32,
    uom: 'cm'
  }
}
{
  _id: ObjectId('675407b9a99dc4d25fae6647'),
  item: 'canvas2',
  qty: 90,
  tags: [
    'copper'
  ],
  size: {
    h: 48,
    w: 35.5,
    uom: 'cm'
  }
}
{
  _id: ObjectId('675407b9a99dc4d25fae6648'),
  item: 'canvas3',
  qty: 100,
  tags: [
    'zinc'
  ],
  size: {
    h: 20,
    w: 35,
    uom: 'cm'
  }
}
{
  _id: ObjectId('675407b9a99dc4d25fae6649'),
  item: 'canvas4',
  qty: 200,
  tags: [
    'iron'
  ],
  size: {
    h: 28,
    w: 37,
    uom: 'cm'
  }
}
{
  _id: ObjectId('675407b9a99dc4d25fae664a'),
  item: 'canvas5',
  qty: 20,
  tags: [
    'aluminium'
  ],
  size: {
    h: 28,
    w: 50,
    uom: 'cm'
  }
}
```

ids can be different in different devices as outputs.

3.2.2 To fetch particular items with a filter

```shell
db.inventory.find({qty:90})
```

Output

```shell
{
  _id: ObjectId('675407b9a99dc4d25fae6647'),
  item: 'canvas2',
  qty: 90,
  tags: [
    'copper'
  ],
  size: {
    h: 48,
    w: 35.5,
    uom: 'cm'
  }
}
```

3.2.3 To search using complex filters

```shell
db.inventory.find({tags:{$in:["iron", "copper"]}})
```

Output

```shell
{
  _id: ObjectId('675407b9a99dc4d25fae6647'),
  item: 'canvas2',
  qty: 90,
  tags: [
    'copper'
  ],
  size: {
    h: 48,
    w: 35.5,
    uom: 'cm'
  }
}
{
  _id: ObjectId('675407b9a99dc4d25fae6649'),
  item: 'canvas4',
  qty: 200,
  tags: [
    'iron'
  ],
  size: {
    h: 28,
    w: 37,
    uom: 'cm'
  }
}
```

Now \
Using another data

```shell
db.inventory.insertMany( [
   { item: "canvas", qty: 100, size: { h: 28, w: 35.5, uom: "cm" }, status: "A" },
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "mat", qty: 85, size: { h: 27.9, w: 35.5, uom: "cm" }, status: "A" },
   { item: "mousepad", qty: 25, size: { h: 19, w: 22.85, uom: "cm" }, status: "P" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "P" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" },
   { item: "sketchbook", qty: 80, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "sketch pad", qty: 95, size: { h: 22.85, w: 30.5, uom: "cm" }, status: "A" }
] );
```

Output

```shell
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('675420b4e9c4c3b00265bdac'),
    '1': ObjectId('675420b4e9c4c3b00265bdad'),
    '2': ObjectId('675420b4e9c4c3b00265bdae'),
    '3': ObjectId('675420b4e9c4c3b00265bdaf'),
    '4': ObjectId('675420b4e9c4c3b00265bdb0'),
    '5': ObjectId('675420b4e9c4c3b00265bdb1'),
    '6': ObjectId('675420b4e9c4c3b00265bdb2'),
    '7': ObjectId('675420b4e9c4c3b00265bdb3'),
    '8': ObjectId('675420b4e9c4c3b00265bdb4'),
    '9': ObjectId('675420b4e9c4c3b00265bdb5')
  }
}
```

```shell
db.inventory.find({status:{$in:["A","D"]}})
```

Output

```shell
{
  _id: ObjectId('675420b4e9c4c3b00265bdac'),
  item: 'canvas',
  qty: 100,
  size: {
    h: 28,
    w: 35.5,
    uom: 'cm'
  },
  status: 'A'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdad'),
  item: 'journal',
  qty: 25,
  size: {
    h: 14,
    w: 21,
    uom: 'cm'
  },
  status: 'A'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdae'),
  item: 'mat',
  qty: 85,
  size: {
    h: 27.9,
    w: 35.5,
    uom: 'cm'
  },
  status: 'A'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdb1'),
  item: 'paper',
  qty: 100,
  size: {
    h: 8.5,
    w: 11,
    uom: 'in'
  },
  status: 'D'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdb2'),
  item: 'planner',
  qty: 75,
  size: {
    h: 22.85,
    w: 30,
    uom: 'cm'
  },
  status: 'D'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdb3'),
  item: 'postcard',
  qty: 45,
  size: {
    h: 10,
    w: 15.25,
    uom: 'cm'
  },
  status: 'A'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdb4'),
  item: 'sketchbook',
  qty: 80,
  size: {
    h: 14,
    w: 21,
    uom: 'cm'
  },
  status: 'A'
}
{
  _id: ObjectId('675420b4e9c4c3b00265bdb5'),
  item: 'sketch pad',
  qty: 95,
  size: {
    h: 22.85,
    w: 30.5,
    uom: 'cm'
  },
  status: 'A'
}
```

And Operator

```shell
db.inventory.find({status: "A", qty: {$lt: 30 }})
```

Output

```shell
{
  _id: ObjectId('675420b4e9c4c3b00265bdad'),
  item: 'journal',
  qty: 25,
  size: {
    h: 14,
    w: 21,
    uom: 'cm'
  },
  status: 'A'
}
```

