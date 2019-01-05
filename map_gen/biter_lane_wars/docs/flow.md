create lobby at init -J

after first player joins, start a 3 min timer

after 3 min timer assign players to teams

once teams are assigned generate lanes

lanes need:
    markets, player spawns, creep spawns, "ancient", etc

once teams are in place/teleported players need time to buy/explore

buying: needs markets with items + buffs

after exploration time expires, spawn waves every X seconds until win condition

spawning: requires biter sets, buffs applied, etc.

biters need commands to group, attack. -p6

once the ancient is killed, end game: return players to lobby,  restart 3 minute timer for beginning of match

to reset a match we need to:
    change players to the spectate team, clear all entities, move players to start island, delete lanes, flush tables of their team info, biter info, etc.

design considerations:
allow multiple enemy spawn points
allow multiple player spawn points
allow multiple "ancients"
allow multiple markets
