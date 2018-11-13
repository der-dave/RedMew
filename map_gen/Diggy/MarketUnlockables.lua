-- dependencies
local Config = require 'map_gen.Diggy.config'.features.MarketExchange

-- this
local MarketUnlockables = {}
local marked_prototype_items = {}
local insert = table.insert
local floor = math.floor
local ceil = math.ceil
local log10 = math.log10

local function truncate(precision, formula)
    local number = formula
    local numberlen = floor(log10(number)+1)
    precision = (numberlen >= 8) and (precision+1) or precision
    local exponent = numberlen-precision
    number = number/10^exponent
    number = floor(number)*10^exponent
    return number, numberlen
end

function MarketUnlockables.calculate_level(level) -- all configurable variables must be integers.
    local b = floor(Config.difficulity_scale) or 25 -- Default 25 <-- Controls how much stone is needed.
    local start_value = floor(Config.start_stone) or 50 -- The start value/the first level cost
    local formula = b*(level^3)+(start_value-b)
        
    local precision = floor(Config.cost_precision) or 2 -- Sets the precision
        
    -- Truncates to the precision and prevents dublicates by incrementing with 5 in the third highest place.
    -- First evaluates loosly if the previous level requirement would return same number after truncating. 
    -- If true evaluates down all levels to level 1 for the precise number 
    -- (In case itself got incremented) 
    -- Only useful if three or more values turns out to be the same after truncating, thus the loosly evaluation to save an expensive recursive function
    local number, numberlen = truncate(precision, formula)
    local prev_number = truncate(precision, b*((level-1)^3)+(start_value-b))
    if (level ~= 1 and number == prev_number) then
        local prev_number = MarketUnlockables.calculate_level((level-1))
        while (prev_number >= number) do
            number = (prev_number < number) and number or ceil(number + (5*10^(numberlen-3)))
        end
    end
    return number
end

return MarketUnlockables
