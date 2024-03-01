# Myriota Software Development Kit

Myriota provides satellite connectivity for massive numbers of long battery life sensors, at ultra-low-cost, from any location on the planet. This repository hosts the Myriota Software Development Kit. To get started, take a look at the quick start guide at [developer.myriota.com](https://developer.myriota.com).

## Using Docker Development Environment

1. Install `docker` and `docker compose`
2. Plug in your device and run:

    ```shell
    sudo docker compose up
    ```
3. After the container has finished building, use to get into the container:

    ```shell
    docker exec -i -t myriota-sdk-dev-container bash
    ```

4. Run this command to get your device's ID as a test:

    ```shell
    updater.py -p /dev/ttyUSB0 -i
    ```

> [!IMPORTANT]
> Using `sudo` before `docker compose up` and  `docker start myriota-sdk-dev-container` after stopping the container is necessary so that the container can run in `privileged` mode and be allowed access to serial port.