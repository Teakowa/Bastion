# Bastion Escape

This is a subsequent development version based on [OW2 Bastion Escape](https://workshop.codes/QF8RN).

The classic Bastion Escape 2 experience, but revamped for Overwatch 2.

Work together to sneak past the Bastion prison guards and reach the end of the map to escape as every hero, each time a little harder. AKA Prison Escape or CCTV.

We have added the following content:

## Random Events

At the 2-minute mark after the game commences, the system will randomly assign an event to each surviving player. Subsequently, a new event will be drawn within 30-45 seconds after each event concludes, continuing until the level is cleared or the game ends. Events fall into three categories: buffs, debuffs, and mechanics. They may be a blessing from above or a deadly curse. Your objective remains unchanged—survive and reach the finish line. But now, you must navigate the Bastion's hail of bullets while managing the constant stream of ‘surprises’ or ‘scares’ bestowed upon you.

# Tri-Map Challenge

This mode merges three smaller maps from the Conquest series into one large map. Players must complete all three sections and reach the finish line. If killed, they respawn in the current map's respawn room.

Supported Maps:
    - Lijiang Tower
    - Samoa
    - Oasis
    - Busan

## New Difficulty: Inferno

- AI Bastions deal increased damage
- AI Bastions deploy grenades
- AI Bastion damage reduction cannot be disabled
- Hero selection cannot be skipped

## Third-Person

Players may freely switch between first-person and third-person perspectives

## Auto-Restart

Configurable within Map Workshop settings

## Full Hero Perk Charge

Enable via Map Workshop settings

## CI Auto Release

This repository now includes a GitHub Actions release workflow:

- Trigger: push a tag that matches `v*`.
- Build: compile `src/main.opy` and `src/devMain.opy` through an npm-based OverPy toolchain.
- Release assets: upload `build/main.ow` and `build/devMain.ow` to the generated GitHub Release.

Useful local commands:

- `npm run build:main`
- `npm run build:dev`
- `npm run build`
