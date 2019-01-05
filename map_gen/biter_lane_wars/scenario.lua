-- Create a global table structure for the map
if global.blw_scenario then
    error('Something else registered global.blw_scenario? Something went really wrong.')
end

global.blw_scenario = {
    ['filepath'] = 'map_gen.biter_lane_wars.',
    ['state'] = 'pre-init',
}

local filepath = global.blw_scenario.filepath

local modules = {
    'startup',
}


for _, module in pairs(modules) do
    require(filepath .. module)
end
