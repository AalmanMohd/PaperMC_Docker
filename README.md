# PaperMC_Docker

This is a Linux Docker image build for Paper Minecraft server.

Paper is a high performance fork of the Spigot Minecraft Server that aims to fix gameplay and mechanics inconsistencies as well as to improve performance. Paper contains numerous features, bug fixes, exploit preventions and major performance improvements not found in Spigot.

## DISCLAIMER
I did not create PaperMC. This is just a docker image build to host a PaperMC server.

PaperMC Official Page: https://papermc.io/

## Setup

This container allows the user to pass Java arguments like Aikar's Flag and RAM guidleines to furthur optimise performance

### Basic Setup

```docker run -itd --name papermc -p 25565:25565 aalmanmohd/paper_mc:latest```

To reconnect to terminal in future

```docker attach papermc```

And to exit from the attach use Ctrl+P followed by Ctrl+Q

### Advanced Setup

User can use Env Variables to pass in specific Paper Build number, RAM Guidlines and other Java arguments

#### File Storage

By default the Minecraft Server files will be stored in a docker volume, but to use a custom file bind as storage

```-v /custom/location:/PaperMC```


#### Paper Build (defaults to latest build)

```-e BUILD_NUM="<build-number>"```

Example:
```-e VUILD_NUM="379"```

#### RAM (defaults to 1GB)

```-e RAM="<RAM_AMOUNT>"```

Example:
```-e RAM="3G"```

#### Java Arguments

```-e JAVA_ARGS="<arguments>"```

Example:
```-e JAVA_ARGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200"```


##CREDITS

https://github.com/Phyremaster
