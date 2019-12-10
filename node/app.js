const PORT = process.env.PORT;

const express = require('express');
const app = express();

app.get("/", (req, res) => res.send("Hello world from Node!"));

app.listen(PORT, () => `Server running on ${PORT}`);