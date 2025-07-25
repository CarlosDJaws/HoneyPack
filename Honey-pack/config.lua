-- ------------------------------------------------------------------
-- config.lua
-- All customizable settings for the Honey Pack resource are here.
-- ------------------------------------------------------------------

Config = {}

-- General Settings
Config.ItemName = 'honeypack' -- The item name that your inventory system uses.
Config.EffectDuration = 30000 -- Duration of the effect in milliseconds (30000 = 30 seconds).

-- Image Settings
-- This image will flash on the screen when the item is used.
-- You can use a URL (https://...) or a local file in the 'html' folder (e.g., 'images/honeypack.png').
-- For best results, use a square image (e.g., 400x400 pixels).
Config.ItemImage = 'https://imgur.com/a/HdjUbOb' -- Example: A honey pot image.

-- Sound Settings
Config.MusicFile = 'mario.ogg' -- The name of the sound file in the resource folder.
Config.MusicVolume = 0.4       -- Volume of the music (from 0.0 to 1.0).
