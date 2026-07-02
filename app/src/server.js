const http = require("http");

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {

    console.log(`${req.method} ${req.url}`);

    res.writeHead(200, {
        "Content-Type": "text/plain"
    });

    res.end("Hello from Akamai HTTP Lab!\n");

});

server.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});