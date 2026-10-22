const express = require('express');
const router = express.Router();

const db = require('../../database/db-connector');

router.get('/class-dropdown', async (req, res) => {
    try {
        const query = `
            SELECT id, name
            FROM classes
            ORDER BY id ASC
            ;`;
        
        const [classes] = await db.query(query);

        res.status(200).json({ classes })
        
    } catch (err) {
        console.error("Error executing queries:", err);
        res.status(500).send("Error executing queries.");
    }

});

module.exports = router;