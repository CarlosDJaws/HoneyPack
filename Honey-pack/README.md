# FiveM Honey Pack Resource

## 1. Introduction

Welcome to the Honey Pack resource for FiveM! This script adds a custom usable item to your server called a "Honey Pack". When a player consumes it, they experience a 30-second psychedelic trip complete with visual screen effects, shifting colors, camera shakes, and the iconic Super Mario Bros. theme music.

This resource is fully configurable and is designed for the **ESX framework**.

## 2. Features

* **Custom Usable Item:** Adds a new item that can be integrated into any ESX inventory.
* **Trippy Screen Effects:** Uses multiple `StartScreenEffect` and `AnimpostfxPlay` natives to create a disorienting, colorful experience.
* **Custom Music:** Plays the Super Mario Bros. theme song (`mario.ogg`) during the effect.
* **Image Flash:** Flashes a custom image on the screen when the item is used.
* **Fully Configurable:** Almost every aspect of the effect can be changed in the `config.lua` file.
* **Admin Commands:** Includes commands for admins to easily give the item to players or test the effect.

## 3. How It Works: The File Structure

The script is broken down into several files, each with a specific job:

* **`fxmanifest.lua`**: The core file that tells FiveM what the resource is, who made it, and what files it needs to load.
* **`config.lua`**: The main configuration hub. Here you can change the item name, effect duration, image, and sound settings without touching the core logic.
* **`client.lua`**: The client-side logic. This file handles everything the player sees and hears—it starts the screen effects, plays the music, and cleans everything up when the effect is over.
* **`server.lua`**: The server-side logic. This file registers the item with the ESX framework so it becomes usable and handles the `/givehoneypack` admin command.
* **`honeypack.sql`**: A simple SQL script to add the item to your ESX `items` table in the database.
* **`html/` folder**: This folder contains the NUI (web interface) files.
    * `index.html`: The basic HTML structure that holds the image.
    * `style.css`: The stylesheet that makes the image flash and centers it on the screen.
    * `script.js`: The JavaScript that listens for commands from `client.lua` to show the image and play/stop the music.

## 4. Installation Guide

Follow these steps carefully to install the resource on your ESX server.

**Step 1: Add Files to Server**
1.  Create a folder named `honey-pack` inside your server's `resources` directory.
2.  Place all the provided files (`fxmanifest.lua`, `config.lua`, `client.lua`, `server.lua`, etc.) inside this folder.
3.  Create the `html` sub-folder and place `index.html`, `style.css`, and `script.js` inside it.

**Step 2: Add Music File**
1.  Find and download a copy of the Super Mario Bros. theme song in `.ogg` format.
2.  Rename the file to `mario.ogg`.
3.  Place `mario.ogg` directly inside the `honey-pack` folder.

**Step 3: Update the Database**
1.  Open your server's database using a tool like HeidiSQL or phpMyAdmin.
2.  Run the `honeypack.sql` script. This will add the following item to your `items` table:
    * **Name:** `honeypack`
    * **Label:** `Honey Pack`
    * **Weight:** `1`

**Step 4: Configure Your Inventory**
1.  Open `client.lua`.
2.  Find the line: `RegisterNetEvent('your_inventory:useItem', function(item)`
3.  Change `your_inventory:useItem` to the correct event that your inventory system uses for item consumption (e.g., `esx:useItem`, `qb-inventory:useItem`, etc.).

**Step 5: Start the Resource**
1.  Add the following line to your `server.cfg` file:
    ```
    ensure honey-pack
    ```
2.  Restart your FiveM server.

## 5. Configuration

All customization is done in the `config.lua` file.

* `Config.ItemName`: The name of the item in your database. Must match the name in the `items` table.
* `Config.EffectDuration`: How long the effect lasts, in milliseconds (30000 = 30 seconds).
* `Config.ItemImage`: The URL or local path to the image that flashes on screen. A 400x400px image is recommended.
* `Config.MusicFile`: The name of the music file located in the resource folder.
* `Config.MusicVolume`: The music volume, from `0.0` (silent) to `1.0` (max).

## 6. How to Use

* **For Players:** Use the "Honey Pack" item from your inventory.
* **For Admins:** Use the command `/givehoneypack [Player_ID]` to give the item to a specific player. If no ID is provided, you will receive the item.
* **For Developers:** Use the command `/testhoneypack` to trigger the effect directly without needing the item.

---
**Disclaimer:** The Super Mario Bros. theme music is copyrighted by Nintendo. Use it at your own risk. This resource is intended for personal and educational use.
