function init() {
    const socket = io();
    const cpuC = document.querySelector('#cpuC');
    const cpuF = document.querySelector('#cpuF');

    setInterval(() => {
        socket.emit('renew');
    }, 900)

    socket.on('data', data => {
        cpuC.textContent = parseFloat(data.cpu).toFixed(2);
        cpuF.textContent = (parseFloat(data.cpu) * 1.8 + 32).toFixed(2);
    })
}
init()
