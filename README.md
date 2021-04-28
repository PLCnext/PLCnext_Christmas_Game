# PLCnext-Game

Here you can find an example of a browser game programmed with Lua, which can be generated and hosted on the AXC F 2152.

## Introduction

To create the game, love.js is used, which is LÖVE ported to the web using Emscripten. More information about this free and open-source framework for 2D game development can be found here: [LÖVE - Free 2D Game Engine (love2d.org)](https://love2d.org/)

## Example details

|Description |Value  |
| --- | --- | --- |
|Controller |AXC F 2152 |
|FW |2020.6 or later |

## Preconditions

- AXC F 2152 with SD card and firmware 2020.6 or later
-	Internet access for the PLC

## Installation steps

### Installation of balenaEngine

Install the Docker balenaEngine on the AXC F 2152 as PLCnext App -> [PLCnext Store | balenaEngine-DockerForIOT-ARM](https://www.plcnextstore.com/963)

### Installation of Node.js

Run the "node-installation.sh" script provided here to install Node.js as a Docker container:

```
./node-installation.sh
```
The script will create the folder /opt/plcnext/projects/node-data that is used as shared folder with the container. For external communication port 8000 is defined. This can be adjusted in the shell script if required.

If all went well, you shouldn’t see any error and Node.js welcomes you.
