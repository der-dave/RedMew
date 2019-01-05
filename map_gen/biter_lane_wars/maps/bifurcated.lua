local b = require 'map_gen.shared.builders'
--local RS = require 'map_gen.shared.redmew_surface'

-- place holder shape for testing different map shape functionality, make it prettier later

local centre_lane = b.rectangle(30,120)
local outer_lanes = b.rectangle(30,120)


centre_lane = b.change_tile(centre_lane, true, 'grass-1')
outer_lanes = b.change_tile(outer_lanes, true, 'grass-1')

local lane_container = b.any{
    centre_lane,
    b.translate(outer_lanes, -30,-100),
    b.translate(outer_lanes, 30,-100)
}

lane_container = b.translate(lane_container,0,-50)

return lane_container
