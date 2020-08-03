# Raspi Temp

This image runs a web server that shows in real-time the cpu temp.

## Usage
### Docker CLI
```
docker run -p 8080:8080 alexlndn/raspi-temp
```

### Docker Compose
```
version: "3"
services:
    raspi_temp:
        container_name: raspi_temp
        image: alexlndn/raspi-temp
        ports:
            - 8082:8080
        restart: unless-stopped
```
