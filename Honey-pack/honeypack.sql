-- ------------------------------------------------------------------
-- honeypack.sql
-- This SQL script adds the 'honeypack' item to your ESX database.
-- The item name 'honeypack' should match what is in your config.lua.
-- ------------------------------------------------------------------

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
('honeypack', 'Honey Pack', 1);

