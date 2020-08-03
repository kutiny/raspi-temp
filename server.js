require('dotenv').config()
const http = require('http')
const express = require('express')
const app = express()
const server = http.createServer(app)
const io = require('socket.io')(server)
const { execFileSync } = require('child_process')

io.on('connection', client => {
    client.on('renew', data => {
        if(process.platform === 'win32') {
            client.emit('data', {cpu: '10 °C'})
        }else {
            const a = execFileSync(`./scripts/getTemp.sh`, { stdio: 'pipe' })
            client.emit('data', JSON.parse(a.toString()))
        }
    })
})

app.use(express.static('./public'))

server.listen(process.env.PORT, () => {
    console.log(`Server up on port ${process.env.PORT}`)
})
