-- Dependencies
local Global = require 'utils.global'
local BLW = global.map.blw

-- Localized functions

-- Localized globals

-- Local vars

-- This
local Public = {}

-- Global tokens
local primitives = {
    ['team_index_position'] = 0
}

Global.register(
    {
        primitives = primitives,
    },
    function(tbl)
        primitives = tbl.primitives
    end
)
-- Local functions

local function create_spawn_positions(index)
    local spawn_positions = {}
    -- TODO
    -- Unsure how this will work.
    return spawn_positions
end

-- Public functions

function Public.reset_game()
    primitives['team_index_position'] = 0
end

--- Creates a unique index for a team
function Public.create_unique_team_index()
    primitives['team_index_position'] = primitives['team_index_position'] + 1
    return primitives['team_index_position']
end

--- Creates a new table for a team
-- @param index <number> the number index for the team
function Public.create_team_table(index)
    local team = {
        ['team_force_id'] = index,
        ['spawn_positions'] = {
            create_spawn_positions(index),
        },
        ['purchased_creeps'] = {
            {['small-biter'] = 0},
            {['medium-biter'] = 0},
            {['big-biter'] = 0},
            {['behemoth-biter'] = 0},
            {['small-spitter'] = 0},
            {['medium-spitter'] = 0},
            {['big-spitter'] = 0},
            {['behemoth-spitter'] = 0}
        },
        ['purchased_buffs'] = {
            ['hydra_mode'] = nil,
            ['hydra-chance'] = nil,
            ['movement-speed'] = nil,
            ['kill_all'] = nil,
            ['increase_loot'] = nil,
            ['map_reveal'] = nil,
            ['team_damage_buff'] = nil,
        },
        ['coin_drop_chance'] = 1,
        ['coin_drop_modifier'] = 1,
        ['income_modifier'] = 1
    }
    return team
end

function Public.create_teams()
    local player_count = #game.players

end

return Public
