--[[ The easiest way to create a preset to add to this file is to use factorio itself. Create a new world
    (vanilla, not scenario) and configure the settings you want. When you launch the game, you can run the following:
    /c
    local str = serpent.block(game.surfaces.nauvis.map_gen_settings)
    game.write_file('map_gen_settings.lua', str)

    This will output a file with a table that you can add to this resources file or into your specific map.
    In either case, make sure to set seed to nil unless you want your map to be *exactly* the same each time.
    The expectation is that all changes that deviate from default generation are noted.
    Water size and frequency is not denoted as such. Instead water size = water and water frequency = terrain_segmentation
]]
return {
    -- the default table should not be changed
    default = {
        autoplace_controls = {
            coal = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            ['copper-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            ['crude-oil'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            desert = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            dirt = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            ['enemy-base'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            grass = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            ['iron-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            sand = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            stone = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            trees = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            },
            ['uranium-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'normal'
            }
        },
        cliff_settings = {
            cliff_elevation_0 = 10,
            cliff_elevation_interval = 10,
            name = 'cliff'
        },
        height = 2000000,
        peaceful_mode = false,
        starting_area = 'normal',
        terrain_segmentation = 'normal',
        water = 'normal',
        width = 2000000
    },
    -- components
    -- no enemies
    enemy_none = {
        autoplace_controls = {
            ['enemy-base'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            }
        }
    },
    -- high frequency and big size enemies
    enemy_high = {
        autoplace_controls = {
            ['enemy-base'] = {
                frequency = 'high',
                richness = 'normal',
                size = 'high'
            }
        }
    },
    -- very high frequency and very big size enemies
    enemy_very_high = {
        autoplace_controls = {
            ['enemy-base'] = {
                frequency = 'very-high',
                richness = 'normal',
                size = 'very-high'
            }
        }
    },
    -- no ores
    ore_none = {
        autoplace_controls = {
            coal = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['copper-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['iron-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            stone = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['uranium-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            }
        }
    },
    -- no oil
    oil_none = {
        autoplace_controls = {
            ['crude-oil'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            }
        }
    },
    -- no ores, no oil
    ore_oil_none = {
        autoplace_controls = {
            coal = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['copper-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['crude-oil'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['iron-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            stone = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['uranium-ore'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            }
        }
    },
    -- no water
    water_none = {
        terrain_segmentation = 'normal',
        water = 'none'
    },
    -- no cliffs
    cliff_none = {
        cliff_settings = {
            cliff_elevation_0 = 1024,
            cliff_elevation_interval = 10,
            name = 'cliff'
        }
    },
    -- cliffs to very high frequency, very big size
    cliff_very_high = {
        cliff_settings = {
            cliff_elevation_0 = 2.5000572204589844,
            cliff_elevation_interval = 2.5000572204589844,
            name = 'cliff'
        }
    },
    -- cliffs to very high frequency, very big size
    tree_none = {
        autoplace_controls = {
            trees = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            }
        }
    },
    -- cliffs to very high frequency, very big size
    tree_very_high = {
        autoplace_controls = {
            trees = {
                frequency = 'very-high',
                richness = 'very-high',
                size = 'very-high'
            }
        }
    },
    -- random seed, in case you need/want the seed to be unique from nauvis
    unique_seed = {
        seed = nil
    },
    -- will generate a world with only water
    full_setting_nothing = {
        autoplace_controls = {
            coal = {
                frequency = 'normal',
                richness = 'very-high',
                size = 'none'
            },
            ['copper-ore'] = {
                frequency = 'normal',
                richness = 'very-high',
                size = 'none'
            },
            ['crude-oil'] = {
                frequency = 'normal',
                richness = 'very-high',
                size = 'none'
            },
            desert = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            dirt = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['enemy-base'] = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            grass = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['iron-ore'] = {
                frequency = 'normal',
                richness = 'very-high',
                size = 'none'
            },
            sand = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            stone = {
                frequency = 'normal',
                richness = 'very-high',
                size = 'none'
            },
            trees = {
                frequency = 'normal',
                richness = 'normal',
                size = 'none'
            },
            ['uranium-ore'] = {
                frequency = 'normal',
                richness = 'very-high',
                size = 'none'
            }
        },
        cliff_settings = {
            cliff_elevation_0 = 1024,
            cliff_elevation_interval = 10,
            name = 'cliff'
        },
        height = 2000000,
        peaceful_mode = false,
        starting_area = 'very-low',
        starting_points = {
            {
                x = 0,
                y = 0
            }
        },
        terrain_segmentation = 'normal',
        water = 'none',
        width = 2000000
    }
}
