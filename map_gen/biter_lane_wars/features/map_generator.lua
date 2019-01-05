local filepath = global.blw_scenario.filepath
local Maps = require(filepath .. 'resources.maps')
local b = require 'map_gen.shared.builders'

--[[
    takes a table from maps.lua,
    takes the number of teams from team_setup,
]]
local shape = function(x, y, world)
    return not (x > 20 or x < -20 or y > 20)
end

--this is pseudo I'll check it generates nicely another time
local shape = Maps.single.shape
local lobby = Maps.lobby.shape

local battle_islands = b.single_y_pattern(shape, number_of_teams)   -- this will tile the shape forever
local bounds = b.rectangle((width_of_each_island+space_between_them)*number_of_teams , height_of_each_island)   -- so we create some bounds
local player_islands = b.choose(bounds, battle_islands, b.empty_shape)  -- and crop it

-- then we combine with the starting island
local whole_map = b.any{
    lobby,
    b.translate(player_islands, 0, 300) -- move the row of islands along y
}
-- end bullshit pseudo

if shape then
    local surfaces = {
        [RS.get_surface_name()] = shape,
    }

    require('map_gen.shared.generate')({surfaces = surfaces, regen_decoratives = regen_decoratives, tiles_per_tick = tiles_per_tick})
    --require ("map_gen.shared.generate_not_threaded")({surfaces = surfaces, regen_decoratives = regen_decoratives})
end
