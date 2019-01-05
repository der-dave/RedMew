local b = require 'map_gen.shared.builders'
local RS = require 'map_gen.shared.redmew_surface'

-- The lobby island
local grass_circle = b.circle(20)
grass_circle = b.change_tile(grass_circle, true, 'grass-1')
local sand_circle = b.circle(22)
sand_circle = b.change_tile(sand_circle, true, 'sand-1')

local starting_area = b.any{
    grass_circle,
    sand_circle
}
return starting_area
