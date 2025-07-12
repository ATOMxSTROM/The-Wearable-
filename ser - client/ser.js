const express = require("express");
const http = require("http");
const WebSocket = require("ws");
const cors = require("cors");
const { MongoClient } = require("mongodb");

const app = express();
const port = 4000;
const mongoURL = "mongodb://localhost:27017";
const dbName = "mydatabase";

let db, collection;

async function connectToMongoDB() {
  const client = new MongoClient(mongoURL);
  await client.connect();
  console.log("✅ Connected to MongoDB");
  db = client.db(dbName);
  collection = db.collection("messages");
}

connectToMongoDB().catch(console.error);

app.use(cors());
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

console.log(`✅ WebSocket server is running on ws://0.0.0.0:${port}`);

wss.on("connection", (ws) => {
  console.log("🔗 New client connected");

  ws.on("message", async (message) => {
    try {
      const data = JSON.parse(message);
      console.log("📩 Received data:", data);

      await collection.insertOne(data);
      console.log("✅ Data inserted into MongoDB");

      wss.clients.forEach((client) => {
        if (client.readyState === WebSocket.OPEN) {
          client.send(JSON.stringify(data));
        }
      });
    } catch (error) {
      console.error("❌ Error processing data:", error.message);
    }
  });

  ws.on("close", () => console.log("❌ Client disconnected"));
});

server.listen(port, () => console.log(`✅ Server listening on http://0.0.0.0:${port}`));