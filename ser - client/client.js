const express = require('express');
const cors = require('cors');
const { MongoClient } = require('mongodb');

const app = express();
const port = 3000;

// Middleware
app.use(express.json());
app.use(cors());  // Enable CORS for all routes

// MongoDB connection
const url = 'mongodb://localhost:27017';
const dbName = 'mydatabase';
const collectionName = 'messages';
let db;

MongoClient.connect(url)
  .then(client => {
    console.log('✅ Connected to MongoDB');
    db = client.db(dbName);
  })
  .catch(error => console.error(error));

// Routes
app.get('/data', async (req, res) => {
  try {
    const collection = db.collection(collectionName);
    const data = await collection.find().toArray();
    res.json(data);
  } catch (err) {
    res.status(500).send(err);
  }
});

// Start the server
app.listen(port, () => {
  console.log(`✅ Server is running on http://0.0.0.0:${port}`);
});
