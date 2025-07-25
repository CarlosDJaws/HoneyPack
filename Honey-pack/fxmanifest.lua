-- ------------------------------------------------------------------
-- fxmanifest.lua
-- This file defines the resource, its scripts, and its files.
-- ------------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'A special Honey Pack item that gives a trippy Mario-style experience.'
version '1.1.0'

-- Shared configuration file
shared_script 'config.lua'

-- Client-side script
client_script 'client.lua'

-- Server-side script (for item registration and commands)
server_script 'server.lua'

-- UI files for displaying the image and playing sound
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'mario.ogg' 
}
