#!mainFile "../lunar.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

globalvar __i

subroutine rollActivePacket

def rollActivePacket():
    @Name "rollActivePacket"
    
    activePacket = []
    for __i in range(0, 9):
        activePacket[__i] = random.choice(redPosition.exclude(activePacket))
        # if DEBUG
        # smallMessage(getAllPlayers(), "  {0}".format(activePacket[__i]))
        wait(getAverageServerLoad() / 100 * 0.032)
