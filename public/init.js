function init() {
    const socket = io()
    const cpu = document.querySelector('#cpu')

    setInterval(() => {
        socket.emit('renew')
    }, 900)

    socket.on('data', data => {
        cpu.textContent = data.cpu
    })
}
init()
