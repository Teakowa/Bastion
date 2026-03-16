#!mainFile "../main.opy"

# Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

enum DebuffEventId:
    # legacy numeric id: 0
    GRAVITY_ANOMALY = 0
    # legacy numeric id: 1
    EMP
    # legacy numeric id: 2
    SACRIFICE
    # legacy numeric id: 3
    VULNERABLE
    # legacy numeric id: 4
    SPEED_LIMIT_40
    # legacy numeric id: 5
    GRAVITY_PULL
    # legacy numeric id: 6
    OSTEOPOROSIS
    # legacy numeric id: 7
    EMP_PROMAX
    # legacy numeric id: 8
    ENERGY_LEAK
    # legacy numeric id: 10
    SHARE_THE_PAIN = 10
    # legacy numeric id: 11
    FEAST_FRENZY = 11
    # legacy numeric id: 12
    POWERLESS_SPOUSE = 12
    # legacy numeric id: 13
    GRIEVOUS_WOUNDS = 13
    # legacy numeric id: 14
    HALVED = 14
    # legacy numeric id: 15
    SELFLESS_GIVEAWAY = 15
    # legacy numeric id: 16
    KEEP_DISTANCE_AURA = 16
    # legacy numeric id: 17
    ERROR_404 = 17
    # legacy numeric id: 18
    CHAIN_OVERLOAD = 18
    # legacy numeric id: 19
    HEALTH_SYNC = 19
    # legacy numeric id: 20
    VAMPIRE = 20
    # legacy numeric id: 21
    MOON_ROCKET = 21
    # sentinel only for integrity checks (do not register as an event)
    COUNT

#!define DEBUFF_EVENT_ID_COUNT DebuffEventId.COUNT
