-- NOTE: None of these work as were moved out of the main file in refactoring

-- TO DO
-- Create a table to contain all of these values
-- Create a function in map_layout.lua which iterates through the table and creates each of the markets based on the market groups
-- Replace the retailer set_item things below with the table
-- Get custom sprites working (previously demonstrated by Linaori)
-- Set all of the tomes to have a maximum stack size of 1 (see PR #617)
-- Disable some of the tomes in events.on_market_purchase in biter_lane_wars.lua so that they can only be purchased once and then are disabled for that team

-- dependencies
local Tomes = require ''
local Retailer = require ''
local Creeps = require ''
local Items = require ''

-- localised functions
local format = 'string.format'

-- this
local Public = {}

--- Takes a team and generates their starting market
function Public.setup_market(team)
    local group_name = Retailer.generate_group_id()
    team.market_group_name = group_name
    Retailer.add_market(group_name, market_entity)
    -- Items Market
    for _, item in pairs(Items) do
        Retailer.set_item('items', item)
    end

    -- Creeps Market
    -- the names are placeholders, I've tested the sprite paths DO work, no event has been tested yet ~ Jay
    for _, creep in pairs(Creeps) do
        creep.description = format('+%d %s', calculate_biter_value(), creep.description)
        Retailer.set_item('creeps', creep)
    end

    -- Tome market items
    -- some of these will have multiple levels. We could change the price for the second, third, fourth levels by overwriting the set_item when the event is triggered
    for _, tome in pairs(Tomes) do
        Retailer.set_item('tomes', tome)
    end

    -- Possible interesting features, tomes, items, creeps etc:
    -- team bullet damage
    -- team bullet fire rate
    -- biter coin drop chance/quantity
    -- hydra mode - enables enemy creeps to spawn extras upon death, make this expensive but low chance
    -- hydra rate - enabled when hydra mode enabled. Increases the chances of a biter death spawning another biter for the enemy team
    -- Spy. Removes fog from around enemy teams. Cheap. Useful to see how they cope with the waves you're sending.
    -- Biter damage. Increases enemy team's creep's damage by 1%
    -- Biter health. Increases enemy team's creep's health by 1%
    -- Double wave. Or strong wave. Expensive end game item that if it fails will put the sending team at an income disadvantage.

    Retailer.set_market_group_label('items', 'Items Market')
    Retailer.set_market_group_label('creeps', 'Creeps Market')
    Retailer.set_market_group_label('tomes', 'Tomes Market')
    return market
end

return Public
