// Express
const express = require('express');
const app = express();

// Middleware
const cors = require('cors');
app.use(cors({ credentials: true, origin: "*" }));
app.use(express.json());

const PORT = 5555;

// Routes
const classRoutes = require('./routes/classes');
const skillRoutes = require('./routes/skills');
const tagRoutes = require('./routes/tags');
const filterRoutes = require('./routes/filter');


app.use(classRoutes);
app.use(skillRoutes);
app.use(tagRoutes);
app.use(filterRoutes);


// Listener
app.listen(PORT, function () {
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.');
});
