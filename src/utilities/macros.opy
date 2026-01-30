#!mainFile "../dev_main.opy"

# Source: https://github.com/Overwatch-1-Emulator/ow1-emulator/blob/staging/src/utilities/macro_functions.opy

# Macro function for retrieving id of hero
macro heroID(h):
    getAllHeroes().index(h)

# Check if player is playing hero
macro isHero(player, hero):
    (player.getCurrentHero() == hero)

# Macro function for converting decimal to percent
macro percent(p):
    100*(p)

# Macro function for converting negative number to number
macro negToPos(n):
    n * -1

# Macro function for converting percent to decimal 
macro unpercent(p):
    (p)/100

# Macro function for converting decimal to percent
macro roundedPercent(p):
    round(percent(p))

# Macro function for computing a percent of number
macro percentOf(p, n):
    (p)/100*(n)

# Convert angle in degrees to radians
macro toRadians(deg):
    (Math.PI/180)*deg