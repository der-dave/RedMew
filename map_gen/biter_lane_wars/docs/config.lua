-- Dependencies
local BLW = global.map.blw
local ScenarioInfo = require 'features.gui.info'

local Config = {
    features = {
        -- copied from diggy but useful here
        -- lets you set the coin modifiers for aliens
        -- the modifier value increases the upper random limit that biters can drop

        -- Used to determine the cost per creep, the additional income and max coins dropped by creeps on death
        creep_values = {
            ['small-biter'] = { market_price = 100, income = 10, coin_drop = 2},
            ['medium-biter'] = {market_price = 200, income = 22, coin_drop = 4},
            ['big-biter'] = {market_price = 500, income = 60, coin_drop = 7},
            ['behemoth-biter'] = {market_price = 1000, income = 150, coin_drop = 15},
            ['small-spitter'] = {market_price = 150, income = 10, coin_drop = 2},
            ['medium-spitter'] = {market_price = 300, income = 22, coin_drop = 4},
            ['big-spitter'] = {market_price = 750, income = 60, coin_drop = 10},
            ['behemoth-spitter'] = {market_price = 1500, income = 180, coin_drop = 20}
        },

        -- chance of aliens dropping coins between 0 and 1, where 1 is 100%
        -- this is later configured per team using teams.team["blah"].coin_drop_modifier
        alien_coin_drop_chance = 0.75,

        -- spawns the following units when they die. To disable, remove the contents
        -- any non-rounded number will turn into a chance to spawn an additional alien
        -- example: 2.5 would spawn 2 for sure and 50% chance to spawn one additionally
        hail_hydra = {
            -- spitters
            ['small-spitter'] = {['small-worm-turret'] = 0.2},
            ['medium-spitter'] = {['medium-worm-turret'] = 0.2},
            ['big-spitter'] = {['big-worm-turret'] = 0.2},
            ['behemoth-spitter'] = {['big-worm-turret'] = 0.4},

            -- biters
            ['medium-biter'] = {['small-biter'] = 1.2},
            ['big-biter'] = {['medium-biter'] = 1.2},
            ['behemoth-biter'] = {['big-biter'] = 1.2},

            -- worms
            ['small-worm-turret'] = {['small-biter'] = 2.5},
            ['medium-worm-turret'] = {['small-biter'] = 2.5, ['medium-biter'] = 0.6},
            ['big-worm-turret'] = {['small-biter'] = 3.8, ['medium-biter'] = 1.3, ['big-biter'] = 1.1},
        },

    }


}

ScenarioInfo.set_map_name('Biter Lane Wars')
ScenarioInfo.set_map_description('Team lane defence map.')
ScenarioInfo.set_map_extra_info('- Send biters to your opponents using the market\n- Earn more gold per wave by sending more biters\n- Defend your smelter at all costs!')

--Config.



return Config
