const express = require('express');
const router = express.Router();

const db = require('../../database/db-connector');

router.get('/skills/:id', async (req, res) => {
    const id = req.params.id;

    try {
        const query = `
            SELECT * FROM skills
            WHERE class_id = ${id}
            ORDER BY lv_unlock ASC
            ;`;

        const [skills] = await db.query(query);
    
        res.status(200).json({ skills });

    } catch (err) {
        console.error("Error executing queries:", err);
        res.status(500).send("Error executing queries.");
    }
    
});

router.get('/skill/:id', async(req, res) => {
    const id = req.params.id;

    try {
        const query = `
            SELECT name, detailed_descr, cooldown
            FROM skills
            WHERE id = ${id}
        ;`;

        const [skill] = await db.query(query);

        res.status(200).json({skill});

    } catch (err) {
        res.status(500).send("Error executing queries.")
    }
})

/**
 * Sends request to get level info for a skill.
 */
router.get('/lvinfo/:id', async(req, res) => {
    const id = req.params.id;

    try {
        const query = `
            SELECT var1, var2, var3
            FROM skill_levels
            WHERE skill_id = ${id}
        ;`;

        const [lvInfo] = await db.query(query);

        res.status(200).json({lvInfo});

    } catch (err) {
        res.status(500).send("Error executing queries.")
    }
})

/**
 * Sends request to get specializations info for a skill.
 */
router.get('/skSpecs/:id', async(req, res) => {
    const id = req.params.id;

    try {
        const query = `
            SELECT specialties.id, specialties.descr
            FROM skills
                LEFT JOIN skill_specialties
                ON skills.id = skill_specialties.skill_id
                LEFT JOIN specialties
                ON skill_specialties.specialty_id = specialties.id
            WHERE skills.id = ${id}
        ;`;

        const [specs] = await db.query(query);

        res.status(200).json({specs});

    } catch (err) {
        res.status(500).send("Error executing queries.")
    }
})

module.exports = router;