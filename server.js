require('dotenv').config()
const http = require('http')
const express = require('express')
const app = express()
const server = http.createServer(app)
const io = require('socket.io')(server)
const { execSync } = require('child_process')

io.on('connection', client => {
    client.on('renew', data => {
        if(process.platform === 'win32') {
            client.emit('data', {cpu: '10 °C'})
        }else {
            const a = execSync(`
            cpuTemp=$(cat /sys/class/thermal/thermal_zone0/temp)
            cpuTemp2=$(echo $cpuTemp | cut -c3-4)
            cpuTemp="$((cpuTemp / 1000)).$cpuTemp2 °C"
            echo cpu:$cpuTemp
            `)
            const parsed = a.toString().split(':')
            const data = {
                [parsed[0]]: parsed[1]
            }
            client.emit('data', data)
        }
    })
})

app.use(express.static('./public'))

server.listen(process.env.PORT, () => {
    console.log(`Server up on port ${process.env.PORT}`)
})
