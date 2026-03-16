#!mainFile "../main.opy"

# Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

enum MechEventId:
    # legacy numeric id: 0
    EXTREME_CHALLENGE = 0
    # legacy numeric id: 2
    GAMBLER = 2
    # legacy numeric id: 4
    MINI_FORM = 4
    # legacy numeric id: 5
    STEALTH_CROUCH = 5
    # legacy numeric id: 7
    BRAKE_FAILURE = 7
    # legacy numeric id: 8
    JUMP_THRUST = 8
    # legacy numeric id: 9
    GAMBLER_SPEED_CHALLENGE = 9
    # legacy numeric id: 10
    CHEAT_CARD_COUNTING = 10
    # legacy numeric id: 12
    GAMBLER_SHORT_INVESTMENT = 12
    # legacy numeric id: 13
    FATE_SYNC = 13
    # legacy numeric id: 14
    CHEAT_SKIP_HERO = 14
    # legacy numeric id: 15
    NESTING_DOLL = 15
    # legacy numeric id: 17
    GAMBLER_LONG_INVESTMENT = 17
    # legacy numeric id: 18
    VALKYRIE_DESCENT = 18
    # legacy numeric id: 19
    TRINITY_SSR = 19
    # sentinel only for integrity checks (do not register as an event)
    COUNT

#!define MECH_EVENT_ID_COUNT MechEventId.COUNT
