require('dotenv').config()
const http = require('http')
const express = require('express')
const app = express()
const server = http.createServer(app)
const io = require('socket.io')(server)
const { execFileSync } = require('child_process')

io.on('connection', client => {
    client.on('renew', data => {
        const a = execFileSync(`./scripts/getTemp.sh`)
        console.log(JSON.parse(a.toString()))
        client.emit('data', JSON.parse(a.toString()))
    })

    client.on('disconnect', () => {
        console.log("Client disconnected.")
    })
})

app.use(express.static('./public'))

server.listen(process.env.PORT, () => {
    console.log(`Server up on port ${process.env.PORT}`)
})