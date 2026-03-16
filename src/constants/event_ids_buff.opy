#!mainFile "../main.opy"

# Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

enum BuffEventId:
    # legacy numeric id: 0
    OLIVIA_GIFT = 0
    # legacy numeric id: 1
    GALE_BLESSING
    # legacy numeric id: 2
    IRON_BULWARK
    # legacy numeric id: 3
    ADRENALINE
    # legacy numeric id: 4
    LIFE_SPRING
    # legacy numeric id: 5
    BLACK_FANS_ASSAULT
    # legacy numeric id: 6
    SPEED_STACK
    # legacy numeric id: 7
    FLESH_REGEN
    # legacy numeric id: 8
    HEART_OF_STEEL
    # legacy numeric id: 9
    DANGER_SENSE
    # legacy numeric id: 10
    REACTIVE_ARMOR
    # legacy numeric id: 11
    DEATH_DELAY
    # legacy numeric id: 12
    SYMBIOSIS
    # legacy numeric id: 13
    KONAMI_CODE
    # legacy numeric id: 14
    PHOTON_SHIELD
    # legacy numeric id: 15
    PHOTON_RESPIRATOR
    # legacy numeric id: 16
    REGROUP_CALL
    # legacy numeric id: 19
    WILL_TO_WIN = 19
    # legacy numeric id: 20
    PHEIDIPPIDES_TRIAL = 20
    # legacy numeric id: 21
    HEART_OF_STEEL_PRO = 21
    # legacy numeric id: 22
    STAT_POWER = 22
    # legacy numeric id: 23
    ULT_MOMENTUM = 23
    # legacy numeric id: 24
    PHASE_SURGE = 24
    # legacy numeric id: 25
    BODYGUARD = 25
    # legacy numeric id: 26
    MARTYR_TRIAL = 26
    # legacy numeric id: 27
    HYPERACTIVE_HEAL = 27
    # legacy numeric id: 28
    MORALE_BOOST_PROMAX = 28
    # legacy numeric id: 29
    F5_REFRESH = 29
    # legacy numeric id: 30
    HEALING_TOWER_PROMAX = 30
    # legacy numeric id: 31
    SUPER_TRANSFORM = 31
    # legacy numeric id: 32
    DRAW_FIRE = 32
    # legacy numeric id: 33
    TENACITY = 33
    # sentinel only for integrity checks (do not register as an event)
    COUNT

#!define BUFF_EVENT_ID_COUNT BuffEventId.COUNT
