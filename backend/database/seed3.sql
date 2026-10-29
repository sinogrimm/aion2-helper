SET @ranger_id = (SELECT id FROM classes WHERE name = 'Ranger');
SET @active_id = (SELECT id FROM tags WHERE name = 'Active');
SET @passive_id = (SELECT id FROM tags WHERE name = 'Passive');
SET @stigma_id = (SELECT id FROM tags WHERE name = 'Stigma');

INSERT INTO skills
(name, lv_unlock, brief_descr, detailed_descr, cooldown, class_id, tag_id)
VALUES
(
    'Snipe',
    1,
    'Combo for mana regen.',
    'Deals X Wind damage to a target within 20m and restores 120 MP.',
    DEFAULT,
    @ranger_id,
    @active_id
),
(
    'Tempest Shot',
    1,
    'Comfor for spending mana.',
    'Selects a target within 20m and deals X Wind damage to up to 4 enemies within 4m of the target.',
    DEFAULT,
    @ranger_id,
    @active_id
),
(
    'Snare Shot',
    1,
    'AOE Slow.',
    CONCAT (
        'Selects a target within 20m and deals X Earth damage to up to 4 enemies within 4m of the target.',
        ' Inflicts Slow, reducing Move Speed by 40% for 5s.'
    ),
    15,
    @ranger_id,
    @active_id
),
(
    'Marking Shot',
    3,
    'Mobility and buff.',
    CONCAT (
        'Deals X Wind damage to a target within 20m.',
        ' Moves the caster in the input direction and grants Precision for 10s.',
        ' Precision increases Critical Hit by 300.'
    ),
    10,
    @ranger_id,
    @active_id
),
(
    'Drill Dart',
    4,
    'AOE Bleed.',
    CONCAT (
        'Selects a target within 20m and deals X Fire damage to up to 4 enemies within 4m of the target.',
        ' Restores 100 MP on landing a Critical Hit.',
        ' Inflicts Bleed, dealing X Fire damage every 1s for 6s and reducing Incoming Heal by 60%.'
    ),
    5,
    @ranger_id,
    @active_id
),
(
    'Arrow Scattershot',
    5,
    'Stagger exploit.',
    'Deals X Wind damage to a target afflicted with Stagger within 20m.',
    DEFAULT,
    @ranger_id,
    @active_id
),
(
    'Gale Arrow',
    7,
    'Attack and buff.',
    CONCAT (
        'Selects a target within 20m and deals X Wind damage to up to 4 enemies within 4m of the target.',
        ' Grants Gale for 10s; Gale increases Combat Speed by 7%, and Damage Boost by 7%.'
    ),
    20,
    @ranger_id,
    @active_id
),
(
    'Explosion Trap',
    8,
    'Sets mine with chance to stun.',
    CONCAT (
        'Sets an explosive trap at the caster''s location.',
        ' The trap lasts for 10s and deals X Earth damage to up to 4 enemies within 5m when stepped on.',
        ' Has a 40% chance to inflict Stun for 3s.'
    ),
    20,
    @ranger_id,
    @active_id
),
(
    'Burst Arrow',
    10,
    'Slow and Root exploit.',
    CONCAT (
        'Selects a target afflicted with Slow or Root within 20m and deals X Wind damage to up to 4 enemies within 4m of the target.'
    ),
    20,
    @ranger_id,
    @active_id
),
(
    'Suppressing Arrow',
    12,
    'Attack with chance to stun during Precision.',
    CONCAT (
        'Deals X Wind damage to a target within 20m with a 40% chance to inflict Stun for 3s while Precision is active.'
    ),
    20,
    @ranger_id,
    @active_id
),
(
    'Deadshot',
    14,
    'Charged attack with buff during Precision.',
    CONCAT (
        'Deals X-X Wind damage to a target within 20m.',
        ' Increases damage by 35% if the caster has Precision.'
    ),
    20,
    @ranger_id,
    @active_id
),
(
    'Vigilant Eye',
    1,
    'Increases Evasion and HP.',
    'Increases the caster''s Evasion by 200, Max HP by X%, and restores X-X HP on Evasion.',
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Concentrated Fire',
    6,
    'Extra damage with DOT.',
    'Has a 50% chance to deal X Wind damage to a target taking Damage over Time.',
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Wind Vigor',
    9,
    'Increases Stamina and Move Speed.',
    CONCAT (
        'Increases Max Stamina by X.',
        ' Increases Move Speed by X% for Xs when attacked.'
    ),
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Focused Eye',
    11,
    'Damage buff.',
    CONCAT (
        'Increases the caster''s Accuracy by 100, PvE Damage Boost by X%, PvP Damage Boost by X%, and Double Chance by X%.'
    ),
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Hunter''s Resolve',
    13,
    'Increases Crit Damage.',
    'Increases the caster''s Critical Damage Boost by X%.',
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Unyielding Resolve',
    15,
    'Increases status resistance.',
    'Increases the caster''s Ailment-type Resist and Impact-type Resist by X%.',
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Rooting Eye',
    17,
    'Extra damage with Slow and Root.',
    'Has a 50% chance to deal X Wind damage when landing an attack on a target afflicted with Slow or Root.',
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Melee Fire',
    21,
    'Chance for extra damage and knockback.',
    CONCAT (
        'Has a 25% chance to inflict X extra Wind damage when landing an attack.',
        ' Has a 5% chance to inflict Knock Back when attacking a target within 5m.'
    ),
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Revitalization Contract',
    23,
    'Increases status resistance.',
    CONCAT (
        'Increases the caster''s Status Effect Resist by X%.',
        ' Increases Status Effect Resist by 10% for 5s when hit while afflicted with Stun, Knockdown, Airborne, Frost, or Fear (up to 10 stacks).',
        ' Immediately restores X% Max HP when HP is 10% or less.'
    ),
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Hunter''s Soul',
    25,
    'Chance for extra damage on Crit Hit.',
    'Has a 50% chance to deal X Wind damage on a Critical Hit.',
    DEFAULT,
    @ranger_id,
    @passive_id
),
(
    'Arrow Storm',
    22,
    'AOE with chance to stun.',
    CONCAT (
        'Selects a target within 20m and deals X Wind damage to up to 4 enemies within 4m of the target.',
        ' Has a 50% chance to inflict Stun for 3s.'
    ),
    60,
    @ranger_id,
    @stigma_id
),
(
    'Vaizel''s Authority',
    22,
    'Attack buff.',
    'Increases the caster''s Attack by X% for 20s.',
    60,
    @ranger_id,
    @stigma_id
),
(
    'Bow of Blessing',
    22,
    'Increases Critical Hit and Accuracy.',
    'Increases the caster''s Critical Hit by 200 and Accuracy by 100 for Xs.',
    120,
    @ranger_id,
    @stigma_id
),
(
    'Ambush Kick',
    22,
    'Ambush with knockback.',
    CONCAT (
        'Moves behind a target within 5m and deals X Wind damage and inflicts Knock Back.',
        ' The caster moves back.'
    ),
    30,
    @ranger_id,
    @stigma_id
),
(
    'Ensnaring Trap',
    22,
    'Sets mine with Airborne.',
    CONCAT (
        'Sets an explosive trap at the caster''s location.',
        ' The trap lasts for 30s and deals X Earth damage to up to 4 enemies within 5m when stepped on.',
        ' Inflicts Airborne for 3s.'
    ),
    90,
    @ranger_id,
    @stigma_id
),
(
    'Illusory Arrow',
    22,
    'Attack with Blind.',
    'Deals X Wind damage to a target within 20m and inflicts Blind for 3s.',
    30,
    @ranger_id,
    @stigma_id
),
(
    'Stealth',
    22,
    'Temporary hide.',
    'Enter Stealth for 10s. Cannot be used in combat and the Stealth effect is removed upon entering combat.',
    63,
    @ranger_id,
    @stigma_id
),
(
    'Sealing Arrow',
    22,
    'Attack with chance to Seal.',
    CONCAT (
        'Deals X Wind damage to a target within 20m.',
        ' Has a 75% chance to inflict Seal for 5s.'
    ),
    60,
    @ranger_id,
    @stigma_id
),
(
    'Mother Nature''s Breath',
    22,
    'Increases defensives.',
    CONCAT (
        'Increases the caster''s Damage Tolerance by 20% and Critical Hit Resist by 200 for 6s.',
        ' Grants Mother''s Nature''s Embrace for the duration.',
        '\nMother Nature''s Embrace: The caster has a 50% chance to absorb 25% of damage taken as HP'
    ),
    52,
    @ranger_id,
    @stigma_id
),
(
    'Griffon Arrow',
    22,
    'Attack with DOT.',
    CONCAT (
        'Selects a target within 20m and deals X Fire damage to up to 4 enemies within 4m.',
        ' Inflicts Crimson Flames for 10s.\nCrimson Flames: Takes X Fire Damage over Time every 1s.',
        ' Damage over Time amount increases when targets move.'
    ),
    45,
    @ranger_id,
    @stigma_id
),
(
    'Explosive Arrow',
    22,
    'Attack with extra damage on slow and root.',
    CONCAT (
        'Selects a target within 20m and deals X Fire damage to up to 4 enemies within 4m.',
        ' Increases damage by 20% to targets afflicted with Slow or Root.'
    ),
    45,
    @ranger_id,
    @stigma_id
),
(
    'Assault Smite',
    22,
    'AOE with chance to stun.',
    CONCAT (
        'Selects a target within 20m and deals X Wind damage to up to 4 enemies within 4m of the target.',
        ' Has a 30% chance to inflict Stun for 3s.'
    ),
    120,
    @ranger_id,
    @stigma_id
),
(
    'Supporting Fire',
    22,
    'DOT with chance to life steal.',
    CONCAT (
        'Summons an orb that provides supporting fire for 15s near the caster.',
        ' The orb has a 25% chance to fire a shot dealing X Wind damage and absorbing 1.5% HP.'
    ),
    90,
    @ranger_id,
    @stigma_id
);


SET @skill_id = (SELECT id FROM skills WHERE name = 'Snipe');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 47), (@skill_id, 2, 63), (@skill_id, 3, 79),
(@skill_id, 4, 96), (@skill_id, 5, 120), (@skill_id, 6, 151),
(@skill_id, 7, 187), (@skill_id, 8, 217), (@skill_id, 9, 248),
(@skill_id, 10, 278);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% MP restored')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 0.7% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-1s [Deadshot] cooldown on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Adds [Tempest Arrow] Chain Skill'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Tempest Shot');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 56), (@skill_id, 2, 80), (@skill_id, 3, 103),
(@skill_id, 4, 126), (@skill_id, 5, 161), (@skill_id, 6, 205),
(@skill_id, 7, 257), (@skill_id, 8, 301), (@skill_id, 9, 344),
(@skill_id, 10, 388);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '-20% MP consumed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% skill Critical Hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Deals up to 12% more damage when less targets are hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '5% chance to inflict Knock Back on Critical Hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Skill Speed'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Snare Shot');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 60), (@skill_id, 2, 105), (@skill_id, 3, 150),
(@skill_id, 4, 195), (@skill_id, 5, 263), (@skill_id, 6, 347),
(@skill_id, 7, 447), (@skill_id, 8, 530), (@skill_id, 9, 614),
(@skill_id, 10, 698);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Move Speed reduction')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Skill Speed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Adds [Shackling Arrow] Chain Skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+2s Slow and Root duration'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Marking Shot');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 142), (@skill_id, 2, 202), (@skill_id, 3, 262),
(@skill_id, 4, 353), (@skill_id, 5, 465), (@skill_id, 6, 599),
(@skill_id, 7, 712), (@skill_id, 8, 824), (@skill_id, 9, 937),
(@skill_id, 10, 1049);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+5% Perfect Chance for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '30% chance to inflict Knock Back on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+5s duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1 consecutive use')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Ignores Block and Evasion and lands as a Critical Hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Drill Dart');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 112), (@skill_id, 2, 159), (@skill_id, 3, 207),
(@skill_id, 4, 278), (@skill_id, 5, 367), (@skill_id, 6, 473),
(@skill_id, 7, 562), (@skill_id, 8, 651), (@skill_id, 9, 740),
(@skill_id, 10, 829);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 3% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+2s Bleed duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Skill Speed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Activates [Drill Dart] 1 extra time'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Arrow Scattershot');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 96), (@skill_id, 2, 125), (@skill_id, 3, 169),
(@skill_id, 4, 222), (@skill_id, 5, 287), (@skill_id, 6, 340),
(@skill_id, 7, 394), (@skill_id, 8, 448), (@skill_id, 9, 502),
(@skill_id, 10, 566);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 5% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 120 MP on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-1s all cooldowns on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Gale Arrow');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 365), (@skill_id, 2, 491), (@skill_id, 3, 647),
(@skill_id, 4, 834), (@skill_id, 5, 991), (@skill_id, 6, 1147),
(@skill_id, 7, 1304), (@skill_id, 8, 1460), (@skill_id, 9, 1647),
(@skill_id, 10, 1804);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+5s duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to inflict Knock Back on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Increases Combat Speed, PvE Damage Boost, and PvP Damage Boost when less targets hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-10s cooldown'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Explosion Trap');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 344), (@skill_id, 2, 463), (@skill_id, 3, 611),
(@skill_id, 4, 787), (@skill_id, 5, 935), (@skill_id, 6, 1082),
(@skill_id, 7, 1230), (@skill_id, 8, 1378), (@skill_id, 9, 1554),
(@skill_id, 10, 1702);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Pulls enemies on explosion')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1s Stun duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Extra damage after 3s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Stun Chance')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1 consecutive use'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Burst Arrow');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 544), (@skill_id, 2, 717), (@skill_id, 3, 925),
(@skill_id, 4, 1098), (@skill_id, 5, 1271), (@skill_id, 6, 1445),
(@skill_id, 7, 1618), (@skill_id, 8, 1825), (@skill_id, 9, 1999),
(@skill_id, 10, 2125);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 10% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Up to +20% damage when less targets hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '25% chance to reset cooldown on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Suppressing Arrow');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 362), (@skill_id, 2, 477), (@skill_id, 3, 615),
(@skill_id, 4, 730), (@skill_id, 5, 846), (@skill_id, 6, 961),
(@skill_id, 7, 1076), (@skill_id, 8, 1214), (@skill_id, 9, 1329),
(@skill_id, 10, 1414);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1s Stun duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Skill Speed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Stun Chance')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '25% chance to reset cooldown on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Deadshot');
INSERT INTO skill_levels (skill_id, level, var1, var2) VALUES
(@skill_id, 1, 599, 1798), (@skill_id, 2, 772, 2316), (@skill_id, 3, 917, 2751),
(@skill_id, 4, 1061, 3185), (@skill_id, 5, 1206, 3619), (@skill_id, 6, 1351, 4053),
(@skill_id, 7, 1524, 4572), (@skill_id, 8, 1668, 5006), (@skill_id, 9, 1774, 5324),
(@skill_id, 10, 1852, 5557);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Removes MP consumed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+30% Skill Speed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Ignores Block and Evasion and lands as Multi-Hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '[Deadshot] grants extra damage on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Concentrated Fire');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 56), (@skill_id, 2, 75), (@skill_id, 3, 99),
(@skill_id, 4, 127), (@skill_id, 5, 151), (@skill_id, 6, 175),
(@skill_id, 7, 199), (@skill_id, 8, 223), (@skill_id, 9, 252),
(@skill_id, 10, 276);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Rooting Eye');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 143), (@skill_id, 2, 170), (@skill_id, 3, 197),
(@skill_id, 4, 224), (@skill_id, 5, 251), (@skill_id, 6, 283),
(@skill_id, 7, 310), (@skill_id, 8, 329), (@skill_id, 9, 344),
(@skill_id, 10, 364);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Melee Fire');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 148), (@skill_id, 2, 169), (@skill_id, 3, 189),
(@skill_id, 4, 213), (@skill_id, 5, 234), (@skill_id, 6, 248),
(@skill_id, 7, 259), (@skill_id, 8, 274), (@skill_id, 9, 289),
(@skill_id, 10, 304);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Hunter''s Soul');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 344), (@skill_id, 2, 386), (@skill_id, 3, 435),
(@skill_id, 4, 476), (@skill_id, 5, 507), (@skill_id, 6, 529),
(@skill_id, 7, 559), (@skill_id, 8, 589), (@skill_id, 9, 620),
(@skill_id, 10, 650);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Vigilant Eye');
INSERT INTO skill_levels (skill_id, level, var1, var2, var3) VALUES
(@skill_id, 1, 6, 85, 102), (@skill_id, 2, 7, 107, 128), (@skill_id, 3, 8, 140, 168),
(@skill_id, 4, 9, 176, 211), (@skill_id, 5, 10, 260, 312), (@skill_id, 6, 11, 303, 364),
(@skill_id, 7, 12, 372, 446), (@skill_id, 8, 13, 439, 527), (@skill_id, 9, 14, 481, 577),
(@skill_id, 10, 15, 562, 674);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Wind Vigor');
INSERT INTO skill_levels (skill_id, level, var1, var2, var3) VALUES
(@skill_id, 1, 15, 10, 1.0), (@skill_id, 2, 30, 11, 1.0), (@skill_id, 3, 45, 12, 1.2),
(@skill_id, 4, 60, 13, 1.2), (@skill_id, 5, 75, 14, 1.4), (@skill_id, 6, 90, 15, 1.4),
(@skill_id, 7, 105, 16, 1.6), (@skill_id, 8, 120, 17, 1.6), (@skill_id, 9, 135, 18, 1.8),
(@skill_id, 10, 150, 19, 1.8);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Focused Eye');
INSERT INTO skill_levels (skill_id, level, var1, var2, var3) VALUES
(@skill_id, 1, 1, 0.5, 0.2), (@skill_id, 2, 2, 1.0, 0.4), (@skill_id, 3, 3, 1.5, 0.6),
(@skill_id, 4, 4, 2.0, 0.8), (@skill_id, 5, 5, 2.5, 1.0), (@skill_id, 6, 6, 3.0, 1.2),
(@skill_id, 7, 7, 3.5, 1.4), (@skill_id, 8, 8, 4.0, 1.6), (@skill_id, 9, 9, 4.5, 1.8),
(@skill_id, 10, 10, 5.0, 2.0);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Hunter''s Resolve');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 6), (@skill_id, 2, 7), (@skill_id, 3, 8),
(@skill_id, 4, 9), (@skill_id, 5, 10), (@skill_id, 6, 11),
(@skill_id, 7, 12), (@skill_id, 8, 13), (@skill_id, 9, 14),
(@skill_id, 10, 15);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Unyielding Resolve');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 11.2), (@skill_id, 2, 12.4), (@skill_id, 3, 13.6),
(@skill_id, 4, 14.8), (@skill_id, 5, 16), (@skill_id, 6, 17.2),
(@skill_id, 7, 18.4), (@skill_id, 8, 19.6), (@skill_id, 9, 20.8),
(@skill_id, 10, 22);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Revitalization Contract');
INSERT INTO skill_levels (skill_id, level, var1, var2) VALUES
(@skill_id, 1, 17, 35), (@skill_id, 2, 19, 36), (@skill_id, 3, 21, 37),
(@skill_id, 4, 23, 38), (@skill_id, 5, 25, 39), (@skill_id, 6, 27, 40),
(@skill_id, 7, 29, 41), (@skill_id, 8, 31, 42), (@skill_id, 9, 33, 43),
(@skill_id, 10, 35, 44);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Arrow Storm');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 1184), (@skill_id, 2, 1345), (@skill_id, 3, 1507),
(@skill_id, 4, 1700), (@skill_id, 5, 1861), (@skill_id, 6, 1979),
(@skill_id, 7, 2066), (@skill_id, 8, 2184), (@skill_id, 9, 2302),
(@skill_id, 10, 2420);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Up to +20% max damage when more targets hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Inflicts Slow for 10s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1s Stun duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+25% Stun Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Vaizel''s Authority');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 10), (@skill_id, 2, 10), (@skill_id, 3, 11),
(@skill_id, 4, 11), (@skill_id, 5, 12), (@skill_id, 6, 12),
(@skill_id, 7, 13), (@skill_id, 8, 13), (@skill_id, 9, 14),
(@skill_id, 10, 14);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Perfect Chance for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Focused Eye] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Hunter''s Soul] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to reduce all skill cooldowns by 1s on Critical Hit for the duration'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Bow of Blessing');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 10), (@skill_id, 2, 10), (@skill_id, 3, 11),
(@skill_id, 4, 11), (@skill_id, 5, 12), (@skill_id, 6, 12),
(@skill_id, 7, 13), (@skill_id, 8, 13), (@skill_id, 9, 14),
(@skill_id, 10, 14);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Multi-Hit Chance for duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Increases Attack proportional to Critical Hit for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Critical Damage Boost for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+7% Double Chance for the duration'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Ambush Kick');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 857), (@skill_id, 2, 974), (@skill_id, 3, 1090),
(@skill_id, 4, 1230), (@skill_id, 5, 1347), (@skill_id, 6, 1432),
(@skill_id, 7, 1495), (@skill_id, 8, 1581), (@skill_id, 9, 1666),
(@skill_id, 10, 1752);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+5m Range')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '10% Max HP Protective Shield for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to inflict Stun for 3s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Stun Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Sealing Arrow');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 1043), (@skill_id, 2, 1185), (@skill_id, 3, 1328),
(@skill_id, 4, 1498), (@skill_id, 5, 1640), (@skill_id, 6, 1744),
(@skill_id, 7, 1820), (@skill_id, 8, 1924), (@skill_id, 9, 2028),
(@skill_id, 10, 2132);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to inflict Root for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-1,000 enemy Max Stamina for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+2s Seal duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+25% Seal chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Griffon Arrow');
INSERT INTO skill_levels (skill_id, level, var1, var2) VALUES
(@skill_id, 1, 964, 482), (@skill_id, 2, 1095, 547), (@skill_id, 3, 1227, 613),
(@skill_id, 4, 1384, 692), (@skill_id, 5, 1515, 757), (@skill_id, 6, 1612, 806),
(@skill_id, 7, 1682, 841), (@skill_id, 8, 1778, 889), (@skill_id, 9, 1875, 937),
(@skill_id, 10, 1971, 985);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+5s Damage over Time duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Enhanced Crimson Flames - Extra damage when hit while afflicted with Crimson Flames')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-50% Damage over Time intervals'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Explosive Arrow');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 1426), (@skill_id, 2, 1621), (@skill_id, 3, 1815),
(@skill_id, 4, 2048), (@skill_id, 5, 2242), (@skill_id, 6, 2385),
(@skill_id, 7, 2489), (@skill_id, 8, 2631), (@skill_id, 9, 2774),
(@skill_id, 10, 2916);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '-15s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% additional damage to targets afflicted with Slow or Root')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Critical Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% additional damage to targets afflicted with Slow or Root'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Ensnaring Trap');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 1218), (@skill_id, 2, 1384), (@skill_id, 3, 1550),
(@skill_id, 4, 1748), (@skill_id, 5, 1914), (@skill_id, 6, 2036),
(@skill_id, 7, 2125), (@skill_id, 8, 2246), (@skill_id, 9, 2368),
(@skill_id, 10, 2489);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Adds [Guerilla Strike] Chain Skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Removes up to 2 buffs')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1s Airborne duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-30s cooldown'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Illusory Arrow');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 1099), (@skill_id, 2, 1249), (@skill_id, 3, 1399),
(@skill_id, 4, 1578), (@skill_id, 5, 1728), (@skill_id, 6, 1838),
(@skill_id, 7, 1918), (@skill_id, 8, 2028), (@skill_id, 9, 2138),
(@skill_id, 10, 2247);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1s Blind duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to AoE Skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Inflicts Slow for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1 consecutive use'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Assault Smite');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 902), (@skill_id, 2, 1025), (@skill_id, 3, 1148),
(@skill_id, 4, 1295), (@skill_id, 5, 1418), (@skill_id, 6, 1508),
(@skill_id, 7, 1574), (@skill_id, 8, 1664), (@skill_id, 9, 1754),
(@skill_id, 10, 1844);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Attack for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '500 MP damage on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10m range')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Stun Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Supporting Fire');
INSERT INTO skill_levels (skill_id, level, var1) VALUES
(@skill_id, 1, 243), (@skill_id, 2, 276), (@skill_id, 3, 310),
(@skill_id, 4, 349), (@skill_id, 5, 382), (@skill_id, 6, 407),
(@skill_id, 7, 425), (@skill_id, 8, 449), (@skill_id, 9, 473),
(@skill_id, 10, 497);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+25% activation chance')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+15s duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-30s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Critical Hit on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Stealth');
INSERT INTO skill_levels (skill_id, level) VALUES
(@skill_id, 1), (@skill_id, 2), (@skill_id, 3), (@skill_id, 4), (@skill_id, 5), (@skill_id, 6),
(@skill_id, 7), (@skill_id, 8), (@skill_id, 9), (@skill_id, 10);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Critical Hit on attack during Stealth')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Move Speed for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Available in combat')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10s Stealth duration'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Mother Nature''s Breath');
INSERT INTO skill_levels (skill_id, level) VALUES
(@skill_id, 1), (@skill_id, 2), (@skill_id, 3), (@skill_id, 4), (@skill_id, 5), (@skill_id, 6),
(@skill_id, 7), (@skill_id, 8), (@skill_id, 9), (@skill_id, 10);
INSERT INTO skill_specialties (skill_id, specialty_id) VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Removes and grants immunity to Damage over Time effects')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Vigilant Eye] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Unyielding Resolve] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% PvE Damage Tolerance increase and +10% PvP Damage Tolerance increase'));

