# PLCnext Game

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Web](https://img.shields.io/badge/PLCnext-Website-blue.svg)](https://www.phoenixcontact.com/plcnext)
[![Community](https://img.shields.io/badge/PLCnext-Community-blue.svg)](https://www.plcnext-community.net)

## Introduction

Here you can find an example of a browser game programmed with Lua, which can be generated and hosted on the AXC F 2152.

To create the game, love.js is used, which is LÖVE ported to the web using Emscripten. More information about this free and open-source framework for 2D game development can be found here -> [LÖVE - Free 2D Game Engine (love2d.org)](https://love2d.org/)

## Example details

|Description |Value  |
| --- | --- |
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

![](https://github.com/PLCnext/PLCnextGame/blob/main/img/node-installation.PNG)

If all went well, you shouldn’t see any error and Node.js welcomes you.


### Installation of love.js

Create a new PuTTY session and run `balena-engine exec -it node /bin/sh` to attach the container console.
Now you can install love.js via `npm install -g love.js`


## Game devolopment

Now you can start programming the game. For this, the programming language Lua is used. It is an easy-to-learn and often used scripting language in the gaming world. However, it is also often used in combination with other languages, like C++, for example. You will find a lot of information and tutorials on the Internet. An overview of framework-related functions and a short introduction can also be found here: [LOVE (love2d.org)](https://love2d.org/wiki/Main_Page)

In addition, you can find a game example in this GitHub repository, whose source code is also available. In this game you have to collect as many PLCnext Control devices as possible within 30 seconds. The devices appear randomly distributed on the playing area.

If you like, you can also make this sample game work on your controller first.


## Deployment of the game as a web application


### Preparatory work

Zip the source files of the game in such a way that the "main.lua" is on top level in the archive directory. Then change the file extension from *.zip* to *.love* .

If you want to work with the game provided here, you can also directly download the file "PLCnext_Game.love".


### Generating JavaScript code

Transfer the *.love* file to your AXC F 2152 and place it in `/opt/plcnext/projects/node-data/MyGames`, e.g. using WinSCP.

Then open the PuTTY window where you have access to the Node.js container console. Here run: 

```
cd data/MyGames
love.js PLCnext_Game.love game -c
cd game
python3 -m http.server 8000
```
The game is now accessible in a web browser via port 8000.

## Starting the game in web browser

In the browser you can enter the URL `http://ip.of.the.plc:8000` to start the game.

![](https://github.com/PLCnext/PLCnextGame/blob/main/img/PLCnextGame_BrowserView.png)

**Please note** that it is not supported by all web browsers. But e.g., Firefox (Version 87.0 (64-bit)) can be used. On smartphones and tablets also the Adblock Browser can handle it (tested with version 2.7.1).


## Additonal information

### How to leave the container console?
To exit the container console, you can simply run `exit` .

### How to stop and start the Node.js container?
To stop the Node.js container, use the following command: `balena-engine stop node` \
To start, execute: `balena-engine start node`

### How to deploy an already generated game?
If the JavaScript code is already available, so the game is in the required format, you can also start the HTTP server directly via Python. There is no need to start Node.js and to attach its container console first. Instead just change to the directory of the game and then execute the following command as admin: `python3 -m http.server <port_number>` .

### Where to find more information?
The Interent is full of good tutorials and information about game devolopment with LÖVE. Here you can find a selection of some useful links:
-	[LOVE (love2d.org)](https://love2d.org/wiki/Main_Page)
-	[Building love2d games for the web with love.js and Docker (kalis.me)](https://kalis.me/building-love2d-games-web-docker/)
-	[GitHub - Davidobot/love.js: LÖVE ported to the web using Emscripten, updated to the latest Emscripten and LÖVE (v11.3)](https://github.com/Davidobot/love.js/)
-	[Make games quickly with LÖVE - YouTube](https://www.youtube.com/watch?v=u6GWjojPQiM)
-	[MAKING A GAME In 3 Easy Steps Using Love2D & Lua (1/3) - YouTube](https://www.youtube.com/watch?v=qA267wyXHeU)
-	[MAKING A GAME In 3 Easy Steps Using Love2D & Lua (2/3) - YouTube](https://www.youtube.com/watch?v=3CRIhC_2wTI)
-	[MAKING A GAME In 3 Easy Steps Using Love2D & Lua (3/3) - YouTube](https://www.youtube.com/watch?v=QWoRboCnsuo)


## Feedback

Provide information how feedback can be given e.g.:

* Ask a question in our [Forum](https://www.plcnext-community.net/index.php?option=com_easydiscuss&view=categories&Itemid=221&lang=en).
* Request a new feature on [GitHub](CONTRIBUTING.md).
* Vote for [Popular Feature Requests](https://github.com/PLCnext/PLCnextGame/issues?q=is%3Aopen+is%3Aissue+label%3Afeature-request+sort%3Areactions-%2B1-desc).
* File a bug in [GitHub Issues](https://github.com/PLCnext/PLCnextGame/issues).

## License

- License for game code:
  
  Copyright (c) Phoenix Contact Gmbh & Co KG. All rights reserved.

  Licensed under the [MIT](LICENSE) License.

- License for font files in /src/assets/fonts:
  
  Copyright 2010, 2012 Adobe Systems Incorporated (http://www.adobe.com/), with Reserved Font Name 'Source'. All Rights Reserved. Source is a trademark of Adobe Systems Incorporated in the United States and/or other countries.
This Font Software is licensed under the SIL Open Font License, Version 1.1.

- License for sound files in /src/assets/sounds
