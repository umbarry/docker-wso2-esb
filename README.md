# Docker WSO2 ESB
Dockerfile for running WSO2ESB in a docker container

## Description
The Dockerfile will use an existing zip archive of the WSO2ESB server.

## Usage

1. Put the zip archive named `wso2esb-${ESB_VERSION}.zip` into the project folder
2. Build the image running 
    ```sh
    docker build [-t image-name] .
    ```

3. Create and run container running
    ```sh
    docker run -d [--network="host"][--name container-name] [-p 9443:9443 -p 9763:9763 -p 8243:8243 -p 8280:8280] [image-name]
    ```

**NOTE**:
Specifing `--network="host"` the address `127.0.0.1` in your docker container will point to your docker host and then it's not necessary to specify port mappings.