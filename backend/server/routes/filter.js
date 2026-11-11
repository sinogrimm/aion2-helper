const express = require("express");
const router = express.Router();
const zmq = require("zeromq");

MSRV_PORT = 5558

router.post("/filter", async (req, res) => {
    // open client socket
    const socket = new zmq.Request();

    try {
        socket.connect(`tcp://localhost:${MSRV_PORT}`);
        console.log(`Connected to filter microservice on port ${MSRV_PORT}.`);

        // zmq nodejs api can only send as string
        await socket.send(JSON.stringify(req.body));

        const [response] = await socket.receive();
        const results = JSON.parse(response)
        console.log(results);
        res.status(200).json(results);

    } catch (error) {
        res.status(500).send("Error processing filter request.")

    } finally {
        socket.close();
        console.log("Socket closed.")
    }
});

module.exports = router;