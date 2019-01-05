local b = require 'map_gen.shared.builders'
local RS = require 'map_gen.shared.redmew_surface'

local lane_background = b.rectangle(50,200)
lane_background = b.change_tile(lane_background, true, 'grass-1')
local small_rectangle = b.rectangle(44,26)
local creep_spawn_area = b.change_tile(small_rectangle, true, 'hazard-concrete-left')
local market_area = b.change_tile(small_rectangle, true, 'concrete')
local lane_container = b.any{
    b.translate(creep_spawn_area, 0, 83),
    b.translate(market_area, 0, -83),
    lane_background
}

lane_container = b.translate(lane_container,0,-80)

return lane_container
