const express = require('express');
const router = express.Router();

const db = require('../../database/db-connector');

router.get('/tags', async (req, res) => {
    try {
        const query = `
            SELECT id, name
            FROM tags
            ORDER BY id ASC
            ;`;
        
        const [tags] = await db.query(query);

        res.status(200).json({ tags })
        
    } catch (err) {
        console.error("Error executing queries:", err);
        res.status(500).send("Error executing queries.");
    }

});

module.exports = router;