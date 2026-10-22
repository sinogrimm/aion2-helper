const express = require('express');
const router = express.Router();

const db = require('../../database/db-connector');

router.get('/skills/:id', async (req, res) => {
    const id = req.params.id;

    try {
        const query = `
            SELECT id, name, brief_descr FROM skills
            WHERE class_id = ${id}
            ;`;

        const [skills] = await db.query(query);
    
        res.status(200).json({ skills });

    } catch (err) {
        console.error("Error executing queries:", err);
        res.status(500).send("Error executing queries.");
    }
    
});

module.exports = router;