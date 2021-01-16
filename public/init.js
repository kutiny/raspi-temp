function init() {
    const socket = io();
    const cpuC = document.querySelector('#cpuC');
    const cpuF = document.querySelector('#cpuF');

    setInterval(() => {
        socket.emit('renew');
    }, 900)

    socket.on('data', data => {
        cpuC.textContent = data.cpu;
        cpuF.textContent = parseInt(data.cpu, 10) * 1.8 + 32;
    })
}
init()
