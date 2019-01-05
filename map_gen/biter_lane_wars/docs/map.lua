--[[
    TO DO:
    - make the lanes fork shaped
]]

--- Creates everything needed on the surface for the play field
-- will call redmew_surface to gen the surface itself

-- Dependencies
--local RS = require 'map_gen.shared.redmew_surface'
local RS = game.surfaces.nauvis
local b = require 'map_gen.shared.builders'

-- Localise globals
local BLW = global.map.blw
local teams = BLW.teams


-- Wrapper from Lin
local Global require 'utils.global'
local memory = {
    team_setup = {
        -- your table,
        -- another table,
        teams = {
            team_force_id = '1',
            team_creeps_force = 'creeps_1', -- this doesn't seem right
            spawn_position = {0,0},
            creeps = {
            -- data for the amount of creeps purchased and the amount
            ['small-biter'] = {qty_bought = 0},
            ['medium-biter'] = {qty_bought = 0},
            ['big-biter'] = {qty_bought = 0},
            ['behemoth-biter'] = {qty_bought = 0},
            ['small-spitter'] = {qty_bought = 0},
            ['medium-spitter'] = {qty_bought = 0},
            ['big-spitter'] = {qty_bought = 0},
            ['behemoth-spitter'] = {qty_bought = 0}
            },
            hydra = {
                enabled = 'false',
                spawn_chance_modifier = 1 -- multiplies the chances in config to allow teams to buff the enemy's spawn chances with a tome
            },
            alien_coin_drop_chance = 0.75,
            coin_drop_modifier = 1, -- multiplies the coin drop chance to allow teams to buy a buff to their loot chance
            income_modifier = 1 -- allows teams to increase their overall income
        },

    },
    current_state = state.in_lobby,
}
Global.register(memory, function (tbl)
    memory = tbl
end)

-- Once redmew_surface is in, we can use it to generate clean terrain
-- RS.map_gen_settings = require 'resources.map_gen_settings'.no_cliffs_trees_ores_water

-- Income prices set so that it's beneficial to save up for a bigger biter rather than spam small ones

-- for each team, create buildings
for _, team in pairs(teams) do
    local item_market = RS.create_entity(['market'],  position={0,60}})
    local creep_market = RS.create_entity(['market'],  position={10,55}})
    local tomes_market = RS.create_entity(['market'],  position={-10,55}})
    local furnace = RS.create_entity(['electric-furnace'],  force="team_1_players" ,position={0,50}}) -- example, change to correct force per team

    item_market.destructible = false
    creep_market.destructible = false
    tomes_market.destructible = false
    Retailer.add_market('items', item_market)
    Retailer.add_market('creeps', creep_market)
    Retailer.add_market('tomes', tomes_market)
end

-- no_resources seems like it should be inside builders or some other shared library ~ Plague
-- Agreed. We will use Plague's new resources.map_gen_settings.set_map_gen_settings function when it's ready ~ Jay
local function no_resources(_, _, world, tile)
    for _, e in ipairs(
        world.surface.find_entities_filtered(
            {type = 'resource', area = {{world.x, world.y}, {world.x + 1, world.y + 1}}}
        )
    ) do
        e.destroy()
    end
    for _, e in ipairs(
        world.surface.find_entities_filtered(
            {type = 'tree', area = {{world.x, world.y}, {world.x + 1, world.y + 1}}}
        )
    ) do
        e.destroy()
    end
    for _, e in ipairs(
        world.surface.find_entities_filtered(
            {type = 'simple-entity', area = {{world.x, world.y}, {world.x + 1, world.y + 1}}}
        )
    ) do
        e.destroy()
    end
    for _, e in ipairs(
        world.surface.find_entities_filtered(
            {type = 'cliff', area = {{world.x, world.y}, {world.x + 1, world.y + 1}}}
        )
    ) do
        e.destroy()
    end

    return tile
end

-- MAP GENERATION
local grass_circle = b.circle(20)
grass_circle = b.change_tile(grass_circle, true, 'grass-1')
local sand_circle = b.circle(22)
sand_circle = b.change_tile(sand_circle, true, 'sand-1')

local starting_area = b.any{
    grass_circle,
    sand_circle
}

-- Later this will be set by vote.
-- Different lane shapes will provide different tactics.
-- We will keep this one for now
local lane_shape = 1

if lane_shape == 1 then
    local lane_background = b.rectangle(50,200)
    lane_background = b.change_tile(lane_background, true, 'grass-1')
    local small_rectangle = b.rectangle(44,26)
    local spawn_area = b.change_tile(small_rectangle, true, 'hazard-concrete-left')
    local market_area = b.change_tile(small_rectangle, true, 'concrete')
    local lane_container = b.any{
        b.translate(spawn_area, 0, 83),
        b.translate(market_area, 0, -83),
        lane_background
    }
    lane_container = b.translate(lane_container,0,-80)
end

local containers = b.circular_pattern(lane_container, 2, 220)   -- Change this to add more containers (and later teams)

local sea = b.change_tile(b.full_shape, true, 'water')          -- turn the void to water
sea = b.fish(sea, 0.00125)

local map = b.any{
    starting_area,
    containers,
    sea
}
map = b.apply_effect(map, no_resources)
return map
