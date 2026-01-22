#!mainFile "../main.opy"

#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

macro Player.disableAbility(button):
    self.disallowButton(button)
    switch button:
        case Button.ABILITY_1:
            self.setAbility1Enabled(false)
        case Button.ABILITY_2:
            self.setAbility2Enabled(false)
        case Button.SECONDARY_FIRE:
            self.setSecondaryFireEnabled(false)
        default:
            break

macro Player.allowAbility(button):
    self.allowButton(button)
    switch button:
        case Button.ABILITY_1:
            self.setAbility1Enabled(true)
        case Button.ABILITY_2:
            self.setAbility2Enabled(true)
        case Button.SECONDARY_FIRE:
            self.setSecondaryFireEnabled(true)
        default:
            break
