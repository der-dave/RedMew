local filepath = global.blw_scenario.filepath
local map_path = filepath .. 'maps.'
return {
    ['lobby'] = {
        ['shape'] = require(map_path .. 'lobby')
    },
    ['single'] = {
        ['name_label'] = 'Single',
        ['description'] = 'Biters come in one lane and the players have 1 object to defend.',
        ['player_spawn_positions'] = {
            {0, 0}
        },
        ['enemy_spawn_positions'] = {
            {0, 100}
        },
        ['lane_width'] = 250,
        ['shape'] = require(map_path .. 'single')
    },
    ['bifurcated'] = {
        ['name_label'] = 'Bifurcated',
        ['description'] = 'Biters come in two lanes and the players have 1 object to defend.',
        ['player_spawn_positions'] = {
            {0, 0}
        },
        ['enemy_spawn_positions'] = {
            {-50, 100},
            {50, 100}
        },
        ['lane_width'] = 250,
        ['shape'] = require(map_path .. 'bifurcated')
    }
}
