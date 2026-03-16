# Event Visual Effect Audit

Date: 2026-03-16

## Summary

This audit reviews event visual effect rules under `src/events/effects/` and classifies them by whether they are safe candidates for a "create once, toggle visibility" pattern.

Classification:

- `attached`: effect follows the player and primarily serves as a sustained status indicator
- `residual`: effect intentionally leaves clouds, trails, or area remnants in the world
- `burst`: effect is a short-lived one-shot response and should not be forced into a persistent entity model

Priority:

- `P1`: implement now
- `P2`: valid follow-up candidate after the first batch
- `Excluded`: intentionally out of scope for this pass

## Findings

| Rule | File | Class | Risk | Decision | Notes |
| --- | --- | --- | --- | --- | --- |
| `悄悄地进村` | `src/events/effects/mechEffects.opy` | attached | High | `P1` | Crouch state could repeatedly create and destroy the same attached player effect. Converted to a single lifecycle-owned effect with visibility gating on crouch state. |
| `我按Q辣` | `src/events/effects/buffEffects.opy` | attached | High | `P1` | Ultimate entry and exit could repeatedly recreate the boost visual during the same event. Converted to one event-owned entity with visibility driven by `isUsingUltimate()`. |
| `足力健` | `src/events/effects/buffEffects.opy` | attached | Medium | `P2` | Current rule already avoids duplicate creation during one moving window, but still tears the effect down when movement stops. Candidate for full event-lifetime ownership in a later pass. |
| `引力异常` | `src/events/effects/debuffEffects.opy` | attached | Medium | `P2` | Current loop keeps the effect alive while the debuff is active, but still couples ownership to the per-tick rule body. A later pass can convert it to an explicit lifecycle rule for consistency. |
| `有点松弛` cloud chain | `src/events/effects/mechEffects.opy` | residual | Intentional | Excluded | The cloud list is a designed trail system with delayed cleanup. Replacing it with a single visibility-toggled effect would change gameplay readability. |
| One-shot explosion / hit / sound effects | `src/events/effects/*` | burst | Low | Excluded | These are not sustained status indicators and should keep their current create-on-trigger semantics. |

## Implemented In This Pass

- `悄悄地进村`
- `我按Q辣`

Both rules now follow the same internal convention:

- create the effect entity once when the event becomes active
- use `EffectReeval.VISIBILITY_POSITION_AND_RADIUS`
- drive `visibleTo` directly from the relevant button or ability condition
- destroy the effect only when the event lifecycle ends or generic event cleanup runs

## Follow-Up Candidates

1. Convert `足力健` to full event-lifecycle ownership and keep movement as visibility-only.
2. Convert `引力异常` to the same lifecycle model if testing confirms no readability regression.
3. If more attached visuals are added later, factor the repeated lifecycle pattern into a documented event-effects convention rather than a new public helper API.
