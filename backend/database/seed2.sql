
SET @active_id = (SELECT id FROM tags WHERE name = 'Active');
SET @passive_id = (SELECT id FROM tags WHERE name = 'Passive');
SET @stigma_id = (SELECT id FROM tags WHERE name = 'Stigma');

SET @templar_id = (SELECT id FROM classes WHERE name = 'Templar');

INSERT INTO skills
(name, lv_unlock, brief_descr, detailed_descr, cooldown, class_id, tag_id)
VALUES
(
    'Vicious Strike',
    DEFAULT,
    'Combo for mana regeneration.',
    CONCAT (
        'Deals X damage to up to 4 enemies within 4m and increases Enmity.',
        ' Restores 100MP.'
    ),
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Pummel',
    DEFAULT,
    'Combo for spending mana.',
    'Deals X damage to up to 4 enemies within 4m and increases Enmity.',
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Poach',
    DEFAULT,
    'Grab and root.',
    CONCAT (
        'Deals X damage to a target within 20m and pulls them in front of the caster,',
        ' with a 75% chance to inflict Root for 2s.'
    ),    
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Shield Smite',
    DEFAULT,
    'Chance to stun and triggers Judgement.',
    CONCAT (
        'Deals X damage to up to 4 enemies within 4m.',
        ' Has 60% chance to inflict Stun on the target for 3s. Triggers [Judgement] for 2s.'
    ),    
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Judgement',
    4,
    'Main source of damage.',
    'Deals X damage to a target within 4m and increases Enmity.',    
    5,
    @templar_id,
    @active_id
),
(
    'Flash Rampage',
    5,
    'Stagger exploit.',
    'Deals X damage to a target afflicted with Stagger within 4m and increases Enmity.',    
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Debilitating Smash',
    7,
    'Attack and debuff triggered on block.',
    CONCAT (
        'Deals X damage to up to 4 enemies within 4m and inflicts Debilitate for 5s on Block.',
        '\nDebilitate: Reduces Defense by 25%.'
    ),
    10,
    @templar_id,
    @active_id
),
(
    'Warding Strike',
    8,
    'Defensive that triggers Judgement.',
    CONCAT (
        'Deals X damage to up to 4 enemies within 5m of the caster.',
        ' Immediately restores X-X HP and grants Warding to the caster for 10s.',
        ' Triggers [Judgement] for 2s.',
        '\nWarding: Increases Damage Tolerance by 20%.'
    ),
    30,
    @templar_id,
    @active_id
),
(
    'Shield Rush',
    10,
    'Mobility triggered on Dodge that triggers Judgement.',
    CONCAT (
        'Rushes to a target within 10m and deals X damage after using [Dodge] or while flying.',
        ' Has a 30% chance to inflict Stun for 3s. Triggers [Judgement] for 2s.'
    ),
    20,
    @templar_id,
    @active_id
),
(
    'Annihilate',
    12,
    'Attack triggered on Stun or Knockdown.',
    CONCAT (
        'Deals X damage to a target afflicted with Stun or Knockdown within 4m',
        ' with a 30% chance to inflict Knockdown for 3s.',
        ' Has a 5% chance to trigger when attacking a target with Incapacitated Immunity.'
    ),
    20,
    @templar_id,
    @active_id
),
(
    'Punishment',
    14,
    'Charged attack with buff.',
    CONCAT (
        'Selects a target within 20m and deals X-X damage to up to 4 enemies',
        ' within 4m of the target and grants the Executor effect to the caster for 20s.',
        '\nExecutor: Increases Accuracy by 200 and PvE Damage Boost by 20%.'
    ),
    30,
    @templar_id,
    @active_id
),
(
    'Enhance Health',
    DEFAULT,
    'Increases HP and Heal.',
    CONCAT (
        'Increases the caster''s HP by X. Increases Max HP by an additional X%',
        ' and Incoming Heal by X%.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Warding Shield',
    6,
    'Increases Block chance.',
    'Increases the caster''s Block by 200 and restores X-X HP on Block.',
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Punishing Benediction',
    9,
    'Increases Crit Hit and buffs.',
    CONCAT (
        'Increases the caster''s Critical Hit by X and grants Punishing Benediction',
        ' for 10s when landing an attack.\nPunishing Benediction: Has a 50% chance to deal',
        ' X extra damage to the target when landing an attack.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Ironclad Defense',
    11,
    'Increases Defense and Endurance.',
    'Increases the caster''s Defense by X% and Endurance by X%.',
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Guarding Seal',
    13,
    'Safety net defensive.',
    CONCAT (
        'Grants a Guarding Seal that blocks damage equaling X% of Max HP for 30s',
        ' when HP is 50% or less.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id    
),
(
    'Impact Hit',
    15,
    'Increases Impact and Double chance.',
    'Increases the caster''s Impact-type Chance by X% and Double Chance by X%.',
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Insulting Roar',
    17,
    'Boosts enmity and attack.',
    CONCAT (
        'Increases Enmity Boost by 100% for the caster and increases Attack by X% for 5s',
        ' on landing a Front Attack.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Fury',
    21,
    'Self and party attack buff.',
    CONCAT (
        'Increases Front Attack Damage Boost by X% for the caster, and increases',
        ' Damage Boost by X% for 20s for the caster and party members on Block.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Survival Willpower',
    23,
    'Increases status resistance.',
    CONCAT (
        'Increases the caster''s Status Effect Resist by X%. Increases Damage Tolerance',
        ' by X% for 5s when afflicted with Stun, Knockdown, Airborne, Frost, or Fear.',
        ' Increases Status Effect Resist by 10% for 5s when hit while afflicted with Stun,',
        ' Knockdown, Airborned, Frost, or Fear (up to 10 stacks).'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Block Pain',
    25,
    'Defensive buff on hit.',
    CONCAT (
        'Grants Block Pain for 10s when struck by an enemy. Block Pain: Increases',
        ' Damage Tolerance by X%.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Empyrean Lord''s Punishment',
    22,
    'AoE with chance to Stun.',
    CONCAT (
        'Selects a target within 20m and deals X damage to up to 4 enemies',
        ' within 4m of the target with a 50% chance to inflict Stun for 3s.'
    ),
    60,
    @templar_id,
    @stigma_id
),
(
    'Nezekan''s Shield',
    22,
    'Party-wide mitigation.',
    CONCAT (
        'Grants a Protective Shield that blocks damage equaling X% of Max HP for',
        ' 3s to the caster and nearby party members within 40m.'
    ),
    60,
    @templar_id,
    @stigma_id
),
(
    'Shield of Protection',
    22,
    'Personal guaranteed block.',
    CONCAT (
        'Temporarily increases Block Damage Reduction by 100% and guarantees Block.',
        ' Restores X MP and Stamina once on Block.'
    ),
    20,
    @templar_id,
    @stigma_id
),
(
    'Taunt',
    22,
    'Increases enmity and applies debuff.',
    CONCAT (
        'Deals X damage to a target within 20m and increases Enmity. Inflict Shrink',
        ' for 15s on hit and has a 50% chance to inflict Taunt for 3s if the target is a',
        ' player.\nShrink: Reduces Accuracy by 200 and Attack by 10%.'
    ),
    30,
    @templar_id,
    @stigma_id
),
(
    'Armor of Balance',
    22,
    'Increases resistance.',
    'Increases Impact-type Resist by 50% for Xs.',
    90,
    @templar_id,
    @stigma_id
),
(
    'Second Skin',
    22,
    'Increases defense.',
    'Increases Damage Tolerance by 30% for Xs.',
    90,
    @templar_id,
    @stigma_id
),
(
    'Doom Shield',
    22,
    'Gap close, chance to knockdown, and triggers Judgement.',
    CONCAT (
        'Rushes to a target within 20m and deals X damage. Has a 75% chance to',
        ' inflict Knockdown for 3s. Grants a Protective Shield that blocks damage',
        ' equaling 5% Max HP for 5s on hit. Triggers [Judgement] for 3s.'
    ),
    30,
    @templar_id,
    @stigma_id
),
(
    'Noble Armor',
    22,
    'Increases HP.',
    'Increases Max HP by X% for 120s and immediately restores HP by X% of Max HP.',
    120,
    @templar_id,
    @stigma_id
),
(
    'Executing Blade',
    22,
    'AoE with debuff.',
    CONCAT (
        'Deals X damage to up to 4 enemies within 4m and reduces Defense by 30%',
        ' for 5s. Deals 20% more damage on attacking a target inflicted with Impact-type',
        ' status.'
    ),
    45,
    @templar_id,
    @stigma_id
),
(
    'Comrade in Arms',
    22,
    'Tank hit for party member.',
    CONCAT (
        'Increases the caster''s Damage Tolerance by 20% and redirects damage taken by',
        ' a party member within 40m each time they are attacked, sharing X% to the',
        ' caster and X% to the attacked party member for 6s.'
    ),
    120,
    @templar_id,
    @stigma_id
),
(
    'Grapple',
    22,
    'AoE grab and root.',
    CONCAT (
        'Selects a target within 20m and deals X damage to up to 4 enemies within',
        ' 7m of the target, pulling them in front of the caster. Inflicts Root for 3s.'
    ),
    90,
    @templar_id,
    @stigma_id
),
(
    'Assault Fury',
    22,
    'Targeted AoE with chance to stun.',
    CONCAT (
        'Selects a target within 20m and deals X damage to up to 4 enemies within',
        ' 4m with 30% chance to inflict Stun for 3s.'
    ),
    120,
    @templar_id,
    @stigma_id
),
(
    'Battlefield Banner',
    22,
    'Increases attack.',
    'Increases Attack proportional to Defense for Xs.',
    90,
    @templar_id,
    @stigma_id
);


-- to reduce the amount of data to process,
-- skill levels will only go up to 10 instead of 20

SET @skill_id = (SELECT id FROM skills WHERE name = 'Vicious Strike');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 79), (@skill_id, 2, 118), (@skill_id, 3, 158),
(@skill_id, 4, 198), (@skill_id, 5, 258), (@skill_id, 6, 332),
(@skill_id, 7, 420), (@skill_id, 8, 494), (@skill_id, 9, 568),
(@skill_id, 10, 642);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% MP restored')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 1% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-2s [Warding Strike] cooldown on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Adds [Threatening Blow] Chain Skill'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Pummel');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 93), (@skill_id, 2, 143), (@skill_id, 3, 193),
(@skill_id, 4, 243), (@skill_id, 5, 318), (@skill_id, 6, 412),
(@skill_id, 7, 523), (@skill_id, 8, 616), (@skill_id, 9, 709),
(@skill_id, 10, 802);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '-20% MP consumed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '[Punishing Strike] absorbs 3% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Deals up to 12% more damage when less targets are hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-1s [Punishment] cooldown on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '[Punishing Strike] grants extra damage on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Poach');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 49), (@skill_id, 2, 86), (@skill_id, 3, 123),
(@skill_id, 4, 160), (@skill_id, 5, 215), (@skill_id, 6, 283),
(@skill_id, 7, 364), (@skill_id, 8, 433), (@skill_id, 9, 501),
(@skill_id, 10, 569);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Moves to the target if target has Incapacitated Immunity')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-20% Status Effect Resist for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Resets cooldown on defeating an enemy')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '10% Max HP Protective Shield')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to Stun for 3s'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Shield Smite');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 173), (@skill_id, 2, 247), (@skill_id, 3, 321),
(@skill_id, 4, 432), (@skill_id, 5, 569), (@skill_id, 6, 732),
(@skill_id, 7, 869), (@skill_id, 8, 1007), (@skill_id, 9, 1144),
(@skill_id, 10, 1281);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1s Stun duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Removes MP Cost and restores 200 MP on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to trigger [Debilitating Smash] on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-2s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'AoE Stun'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Judgement');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 227), (@skill_id, 2, 323), (@skill_id, 3, 419),
(@skill_id, 4, 564), (@skill_id, 5, 743), (@skill_id, 6, 957),
(@skill_id, 7, 1136), (@skill_id, 8, 1315), (@skill_id, 9, 1494),
(@skill_id, 10, 1673);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 1% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Deals extra damage on attacking a target afflicted with Impact-type status')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Extra damage on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Critical Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Remove cooldown'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Flash Rampage');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 152), (@skill_id, 2, 197), (@skill_id, 3, 265),
(@skill_id, 4, 349), (@skill_id, 5, 450), (@skill_id, 6, 534),
(@skill_id, 7, 618), (@skill_id, 8, 703), (@skill_id, 9, 787),
(@skill_id, 10, 887);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 5% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 120 MP on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-1s all cooldowns on hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Debilitating Smash');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 336), (@skill_id, 2, 452), (@skill_id, 3, 596),
(@skill_id, 4, 767), (@skill_id, 5, 910), (@skill_id, 6, 1054),
(@skill_id, 7, 1197), (@skill_id, 8, 1341), (@skill_id, 9, 1512),
(@skill_id, 10, 1656);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '30% chance to inflict Stun for 3s')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+3s Debilitate duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-60% Incoming Heal during Debilitate')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Ignores Block and Evasion and lands as Multi-Hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '25% chance to reset cooldown on Block'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Warding Strike');

INSERT INTO skill_levels (skill_id, level, var1, var2, var3)
VALUES
(@skill_id, 1, 388, 180, 198), (@skill_id, 2, 522, 235, 259), (@skill_id, 3, 688, 296, 326),
(@skill_id, 4, 886, 437, 481), (@skill_id, 5, 1051, 510, 561), (@skill_id, 6, 1217, 625, 688),
(@skill_id, 7, 1383, 739, 813), (@skill_id, 8, 1549, 80, 890), (@skill_id, 9, 1746, 941, 1041),
(@skill_id, 10, 1912, 1015, 1117);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '-5s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+100 Block during Warding')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Heal over Time during Warding')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Adds Damage Tolerance increase effect when more targets hit to Warding')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Damage Tolerance to party members on skill use'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Shield Rush');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 258), (@skill_id, 2, 340), (@skill_id, 3, 437),
(@skill_id, 4, 519), (@skill_id, 5, 601), (@skill_id, 6, 683),
(@skill_id, 7, 765), (@skill_id, 8, 863), (@skill_id, 9, 945),
(@skill_id, 10, 1004);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 300 Stamina on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10m range')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to Charge Skill and deals AoE damage')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-10s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+25% Stun Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Annihilate');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 791), (@skill_id, 2, 1042), (@skill_id, 3, 1341),
(@skill_id, 4, 1592), (@skill_id, 5, 1843), (@skill_id, 6, 2094),
(@skill_id, 7, 2345), (@skill_id, 8, 2644), (@skill_id, 9, 2895),
(@skill_id, 10, 3079);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% Multi-Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Knockdown Chance')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+100% damage to targets with Incapacitated Immunity')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-10s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to AoE Skill'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Punishment');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 1394, 4184), (@skill_id, 2, 1795, 5385), (@skill_id, 3, 2130, 6392),
(@skill_id, 4, 2466, 7400), (@skill_id, 5, 2802, 8407), (@skill_id, 6, 3138, 9415),
(@skill_id, 7, 3538, 10616), (@skill_id, 8, 3874, 11623), (@skill_id, 9, 4119, 12359),
(@skill_id, 10, 4300, 12902);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Absorbs 10% HP')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Inflicts Damage over Time to target on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+30% Skill Speed')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Ignores Block and Evasion and lands as a Critical Hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Enhance Health');

INSERT INTO skill_levels (skill_id, level, var1, var2, var3)
VALUES
(@skill_id, 1, 250, 7, 6), (@skill_id, 2, 500, 10, 7), (@skill_id, 3, 750, 12, 8),
(@skill_id, 4, 1000, 15, 9), (@skill_id, 5, 1250, 17, 10), (@skill_id, 6, 1500, 20, 11),
(@skill_id, 7, 1750, 22, 12), (@skill_id, 8, 2000, 25, 13), (@skill_id, 9, 2250, 27, 14),
(@skill_id, 10, 2500, 30, 15);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Warding Shield');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 53, 64), (@skill_id, 2, 67, 80), (@skill_id, 3, 8, 104),
(@skill_id, 4, 110, 132), (@skill_id, 5, 162, 194), (@skill_id, 6, 189, 227),
(@skill_id, 7, 232, 278), (@skill_id, 8, 275, 330), (@skill_id, 9, 300, 360),
(@skill_id, 10, 351, 421);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Punishing Benediction');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 100, 69), (@skill_id, 2, 110, 93), (@skill_id, 3, 120, 123),
(@skill_id, 4, 130, 158), (@skill_id, 5, 140, 188), (@skill_id, 6, 150, 217),
(@skill_id, 7, 160, 247), (@skill_id, 8, 170, 277), (@skill_id, 9, 180, 312),
(@skill_id, 10, 190, 342);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Ironclad Defense');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 7, 1), (@skill_id, 2, 9, 2), (@skill_id, 3, 11, 3),
(@skill_id, 4, 13, 4), (@skill_id, 5, 15, 5), (@skill_id, 6, 17, 6),
(@skill_id, 7, 19, 7), (@skill_id, 8, 21, 8), (@skill_id, 9, 23, 9),
(@skill_id, 10, 25, 10);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Guarding Seal');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 21), (@skill_id, 2, 22), (@skill_id, 3, 23),
(@skill_id, 4, 24), (@skill_id, 5, 25), (@skill_id, 6, 26),
(@skill_id, 7, 27), (@skill_id, 8, 28), (@skill_id, 9, 29),
(@skill_id, 10, 30);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Impact Hit');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 11, 0), (@skill_id, 2, 12, 0), (@skill_id, 3, 13, 0),
(@skill_id, 4, 14, 1), (@skill_id, 5, 16, 1), (@skill_id, 6, 17, 1),
(@skill_id, 7, 18, 2), (@skill_id, 8, 19, 2), (@skill_id, 9, 20, 2),
(@skill_id, 10, 22, 3);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Insulting Roar');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 5), (@skill_id, 2, 6), (@skill_id, 3, 6),
(@skill_id, 4, 7), (@skill_id, 5, 7), (@skill_id, 6, 8),
(@skill_id, 7, 8), (@skill_id, 8, 9), (@skill_id, 9, 9),
(@skill_id, 10, 10);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Fury');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 0, 5), (@skill_id, 2, 0, 6), (@skill_id, 3, 0, 6),
(@skill_id, 4, 1, 7), (@skill_id, 5, 1, 7), (@skill_id, 6, 1, 8),
(@skill_id, 7, 2, 8), (@skill_id, 8, 2, 9), (@skill_id, 9, 2, 9),
(@skill_id, 10, 3, 10);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Survival Willpower');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 17, 12), (@skill_id, 2, 19, 14), (@skill_id, 3, 21, 16),
(@skill_id, 4, 23, 18), (@skill_id, 5, 25, 20), (@skill_id, 6, 27, 22),
(@skill_id, 7, 29, 24), (@skill_id, 8, 31, 26), (@skill_id, 9, 33, 28),
(@skill_id, 10, 35, 30);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Block Pain');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 11), (@skill_id, 2, 12), (@skill_id, 3, 13),
(@skill_id, 4, 14), (@skill_id, 5, 15), (@skill_id, 6, 16),
(@skill_id, 7, 17), (@skill_id, 8, 18), (@skill_id, 9, 19),
(@skill_id, 10, 20);

SET @skill_id = (SELECT id FROM skills WHERE name = 'Empyrean Lord''s Punishment');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 939), (@skill_id, 2, 1067), (@skill_id, 3, 1195),
(@skill_id, 4, 1348), (@skill_id, 5, 1476), (@skill_id, 6, 1569),
(@skill_id, 7, 1638), (@skill_id, 8, 1731), (@skill_id, 9, 1825),
(@skill_id, 10, 1918);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Up to +20% damage when less targets hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50 Stagger Gauge Damage')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Damage Boost for 10s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+25% Stun Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Nezekan''s Shield');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 41), (@skill_id, 2, 42), (@skill_id, 3, 43),
(@skill_id, 4, 44), (@skill_id, 5, 45), (@skill_id, 6, 46),
(@skill_id, 7, 47), (@skill_id, 8, 48), (@skill_id, 9, 49),
(@skill_id, 10, 50);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% all Element Tolerance for Protective Shield duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+2s Protective Shield duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Damage Tolerance for Protective Shield duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 20% of Max HP when Protective Shield is removed'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Shield of Protection');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 110), (@skill_id, 2, 120), (@skill_id, 3, 130),
(@skill_id, 4, 140), (@skill_id, 5, 150), (@skill_id, 6, 160),
(@skill_id, 7, 170), (@skill_id, 8, 180), (@skill_id, 9, 190),
(@skill_id, 10, 200);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+1 consecutive use')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Changes to mobile skill')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Move Speed for 3s on Block')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 10% HP once on Block'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Taunt');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 888), (@skill_id, 2, 1009), (@skill_id, 3, 1129),
(@skill_id, 4, 1274), (@skill_id, 5, 1395), (@skill_id, 6, 1483),
(@skill_id, 7, 1548), (@skill_id, 8, 1636), (@skill_id, 9, 1725),
(@skill_id, 10, 1813);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Adds 10% Damage Tolerance reduction effect to Shrink')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Shrink Attack reduction')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-5s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+2s Taunt duration, +5s Shrink duration'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Armor of Balance');

INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 10), (@skill_id, 2, 10), (@skill_id, 3, 11),
(@skill_id, 4, 11), (@skill_id, 5, 12), (@skill_id, 6, 12),
(@skill_id, 7, 13), (@skill_id, 8, 13), (@skill_id, 9, 14),
(@skill_id, 10, 14);

INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Ailment-type, Mental-type Resist for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Move Speed for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Warding Shield] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+50% additional Impact-type Resist'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Second Skin');
INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 10), (@skill_id, 2, 10), (@skill_id, 3, 11),
(@skill_id, 4, 11), (@skill_id, 5, 12), (@skill_id, 6, 12),
(@skill_id, 7, 13), (@skill_id, 8, 13), (@skill_id, 9, 14),
(@skill_id, 10, 14);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% all Element Tolerance for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Block for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Ironclad Defense] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Damage Tolerance increase'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Doom Shield');
INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 1254), (@skill_id, 2, 1425), (@skill_id, 3, 1596),
(@skill_id, 4, 1800), (@skill_id, 5, 1971), (@skill_id, 6, 2095),
(@skill_id, 7, 2187), (@skill_id, 8, 2312), (@skill_id, 9, 2437),
(@skill_id, 10, 2562);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Resets [Annihilate] cooldown on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+200 Block for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Resets cooldown on defeating an enemy')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+25% Knockdown Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Noble Armor');
INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 5, 5), (@skill_id, 2, 5, 5), (@skill_id, 3, 6, 6),
(@skill_id, 4, 6, 6), (@skill_id, 5, 7, 7), (@skill_id, 6, 7, 7),
(@skill_id, 7, 7, 7), (@skill_id, 8, 8, 8), (@skill_id, 9, 8, 8),
(@skill_id, 10, 9, 9);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+5% Defense for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Insulting Roar] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Fury] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Incoming Heal for the duration'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Executing Blade');
INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 1335), (@skill_id, 2, 1516), (@skill_id, 3, 1698),
(@skill_id, 4, 1915), (@skill_id, 5, 2097), (@skill_id, 6, 2229),
(@skill_id, 7, 2327), (@skill_id, 8, 2460), (@skill_id, 9, 2593),
(@skill_id, 10, 2726);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '-15s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Inflict Exposed for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Critical Hit on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+30% damage on attacking a target inflicted with Impact-type status'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Comrade in Arms');
INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 50, 50), (@skill_id, 2, 49, 49), (@skill_id, 3, 48, 48),
(@skill_id, 4, 47, 47), (@skill_id, 5, 46, 46), (@skill_id, 6, 45, 45),
(@skill_id, 7, 44, 44), (@skill_id, 8, 43, 43), (@skill_id, 9, 42, 42),
(@skill_id, 10, 41, 41);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 25% of Max HP once if hit during Comrade in Arms while HP is 25% or less')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Guarding Seal] Protective Shield effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'x1.5 [Block Pain] effect for the duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Restores 50% of caster''s Max HP when the effect ends'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Grapple');
INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 1045), (@skill_id, 2, 1188), (@skill_id, 3, 1330),
(@skill_id, 4, 1500), (@skill_id, 5, 1642), (@skill_id, 6, 1746),
(@skill_id, 7, 1823), (@skill_id, 8, 1927), (@skill_id, 9, 2031),
(@skill_id, 10, 2135);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '50% chance to Stun for 3s')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '20% of Max HP as Protective Shield for 10s on use')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-30s cooldown')),
(@skill_id, (SELECT id FROM specialties WHERE descr = 'Up to +20% Damage Tolerance when more targets hit'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Assault Fury');
INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 951), (@skill_id, 2, 1080), (@skill_id, 3, 1210),
(@skill_id, 4, 1364), (@skill_id, 5, 1494), (@skill_id, 6, 1588),
(@skill_id, 7, 1658), (@skill_id, 8, 1752), (@skill_id, 9, 1847),
(@skill_id, 10, 1942);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Attack for 5s on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '500 MP damage on hit')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10m range')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Stun Chance'));

SET @skill_id = (SELECT id FROM skills WHERE name = 'Battlefield Banner');
INSERT INTO skill_levels (skill_id, level, var1)
VALUES
(@skill_id, 1, 10), (@skill_id, 2, 10), (@skill_id, 3, 11),
(@skill_id, 4, 11), (@skill_id, 5, 12), (@skill_id, 6, 12),
(@skill_id, 7, 13), (@skill_id, 8, 13), (@skill_id, 9, 14),
(@skill_id, 10, 14);
INSERT INTO skill_specialties (skill_id, specialty_id)
VALUES
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Multi-Hit Chance for duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+10% Weapon Damage Boost for duration')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '+20% Attack increase proportional to Defense')),
(@skill_id, (SELECT id FROM specialties WHERE descr = '-30s cooldown'));
