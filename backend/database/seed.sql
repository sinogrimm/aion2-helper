INSERT INTO classes (name)
VALUES ('Templar'), ('Ranger');
-- VALUES ('Templar'), ('Ranger'), ('Gladiator'), ('Chanter'), ('Sorceror'),
-- ('Assassin'), ('Cleric'), ('Brawler');
-- to reduce the amount of data to process for assignment 5,
-- not all classes are available, but may be added in the future

INSERT INTO tags (name)
VALUES ('Active'), ('Passive'), ('Stigma');
-- VALUES ('Active'), ('Passive'), ('Stigma'), ('Physical'), ('Magical'),
-- ('Debuff'), ('Buff'), ('Wind'), ('Fire'), ('Earth'), ('Water');
-- to minimize planning fallacy, only skill type tags are considered
-- the rest may be added in the future to expand the filter implementation

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
    'Deals {min_dmg} damage to up to 4 enemies within 4m and increase Enmity.',
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Poach',
    DEFAULT,
    'Gap close mobility.',
    CONCAT (
        'Deals {min_dmg} damage to a target within 20m and pulls them in front of the caster,',
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
        'Deals {min_dmg} damage to up to 4 enemies within 4m.',
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
    'Deals {min_dmg} damage to a target within 4m and increases Enmity.',    
    5,
    @templar_id,
    @active_id
),
(
    'Flash Rampage',
    5,
    'Stagger exploit.',
    'Deals {min_dmg} damage to a target afflicted with Stagger within 4m and increases Enmity.',    
    DEFAULT,
    @templar_id,
    @active_id
),
(
    'Debilitating Smash',
    7,
    'Attack and debuff triggered on block.',
    CONCAT (
        'Deals {min-dmg} damage to up to 4 enemies within 4m and inflicts Debilitate for 5s on Block.',
        '\n','Debilitate: Reduces Defense by 25%.'
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
        'Rushes to a target within 10m and deals {min_dmg} damage after using [Dodge] or while flying.',
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
        'Deals {min_dmg} damage to a target afflicted with Stun or Knockdown within 4m',
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
        'Selects a target within 20m and deals {min-dmg}-{max_dmg} damage to up to 4 enemies',
        ' within 4m of the target and grants the Executor effect to the caster for 20s.',
        ' Executor: Increases Accuracy by 200 and PvE Damage Boost by 20%.'
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
        'Increases the caster''s HP by {min_hp}. Increases Max HP by an additional 30%',
        ' and Incoming Heal by 15%.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Warding Shield',
    6,
    'Increases Block chance.',
    'Increases the caster''s Block by {min_block} and restores {min_hp}-{max_hp} HP on Block.',
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Punishing Benediction',
    9,
    'Increases Crit Hit and buffs.',
    CONCAT (
        'Increases the caster''s Critical Hit by {min_crit} and grants Punishing Benediction',
        ' for 10s when landing an attack. Punishing Benediction: Has a 50% chance to deal',
        ' {min_dmg} extra damage to the target when landing an attack.'
    ),
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Ironclad Defense',
    11,
    'Increases Defense and Endurance.',
    'Increases the caster''s Defense by {min_def}% and Endurance by {min_end} by 10%.',
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Guarding Seal',
    13,
    'Safety net defensive.',
    CONCAT (
        'Grants a Guarding Seal that blocks damage equaling {min_dmg}% of Max HP for 30s',
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
    'Increases the caster''s Impact-type Chance by 22% and Double Chance by 3%.',
    DEFAULT,
    @templar_id,
    @passive_id
),
(
    'Insulting Roar',
    17,
    'Boosts enmity and attack.',
    CONCAT (
        'Increases Enmity Boost by 100% for the caster and increases Attack by 10% for 5s',
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
        'Increases Front Attack Damage Boost by 3% for the caster, and increases PVE',
        ' Damage Boost by 10% for 20s for the caster and party members on Block.'
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
        'Increases the caster''s Status Effect Resist by 35%. Increases PvE Damage Tolerance',
        ' by 30% for 5s when afflicted with Stun, Knockdown, Airborne, Frost, or Fear.',
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
        'Grants Block Pain for 10s when struck by an enemy. Block Pain: Increases PvE',
        ' Damage Tolerance by 10%.'
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
        'Selects a target within 20m and deals {var1} damage to up to 4 enemies',
        ' within 4m of the target with a {var2}% chance to inflict Stun for {var3}s.'
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
        'Grants a Protective Shield that blocks damage equaling {var1}% of Max HP for',
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
        ' Restores 300 MP and Stamina once on Block.'
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
        'Deals {var1} damage to a target within 20m and increases Enmity. Inflict Shrink',
        ' for 15s on hit and has a 50% chance to inflict Taunt for 3s if the target is a',
        ' player. Shrink: Reduces Accuracy by 200 and Attack by 10%.'
    ),
    30,
    @templar_id,
    @stigma_id
),
(
    'Armor of Balance',
    22,
    'Increases resistance.',
    'Increases Impact-type Resist by 50% for 20s.',
    90,
    @templar_id,
    @stigma_id
),
(
    'Second Skin',
    22,
    'Increases defense.',
    'Increases Damage Tolerance by 30% for 20s.',
    90,
    @templar_id,
    @stigma_id
),
(
    'Doom Shield',
    22,
    'Gap close, chance to knockdown, and triggers Judgement.',
    CONCAT (
        'Rushes to a target within 20m and deals {var1} damage. Has a 75% chance to',
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
    'Increases Max HP by 13% for 120s and immediately restores HP by 13% of Max HP.',
    120,
    @templar_id,
    @stigma_id
),
(
    'Executing Blade',
    22,
    'AoE with debuff.',
    CONCAT (
        'Deals {var1} damage to up to 4 enemies within 4m and reduces Defense by 30%',
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
        ' a party member within 40m each time they are attacked, sharing 31% to the',
        ' caster and 31% to the attacked party member for 6s.'
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
        'Selects a target within 20m and deals {var1} damage to up to 4 enemies within',
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
        'Selects a target within 20m and deals {var1} damage to up to 4 enemies within',
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
    'Increases Attack proportional to Defense for 20s.',
    90,
    @templar_id,
    @stigma_id
);

-- to reduce the amount of data to process,
-- skill levels will only go up to 10 instead of 20

SET @skill_id = (SELECT id FROM skills WHERE name = 'Vicious Strike');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 79, 79), (@skill_id, 2, 118, 118), (@skill_id, 3, 158, 158),
(@skill_id, 4, 198, 198), (@skill_id, 5, 258, 258), (@skill_id, 6, 332, 332),
(@skill_id, 7, 420, 420), (@skill_id, 8, 494, 494), (@skill_id, 9, 568, 568),
(@skill_id, 10, 642, 642)
;

SET @skill_id = (SELECT id FROM skills WHERE name = 'Pummel');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 93, 93), (@skill_id, 2, 143, 143), (@skill_id, 3, 193, 193),
(@skill_id, 4, 243, 243), (@skill_id, 5, 318, 318), (@skill_id, 6, 412, 412),
(@skill_id, 7, 523, 523), (@skill_id, 8, 616, 616), (@skill_id, 9, 709, 709),
(@skill_id, 10, 802, 802)
;

SET @skill_id = (SELECT id FROM skills WHERE name = 'Poach');

INSERT INTO skill_levels (skill_id, level, var1, var2)
VALUES
(@skill_id, 1, 49, 49), (@skill_id, 2, 86, 86), (@skill_id, 3, 123, 123),
(@skill_id, 4, 160, 160), (@skill_id, 5, 215, 215), (@skill_id, 6, 283, 283),
(@skill_id, 7, 364, 364), (@skill_id, 8, 433, 433), (@skill_id, 9, 501, 501),
(@skill_id, 10, 569, 569)
;

SET @skill_id = (SELECT id FROM skills WHERE name = 'Warding Strike');

INSERT INTO skill_levels (skill_id, level, var1, var2, var3)
VALUES
(@skill_id, 1, 388, 180, 198), (@skill_id, 2, 522, 235, 259), (@skill_id, 3, 688, 296, 326),
(@skill_id, 4, 886, 437, 481), (@skill_id, 5, 1051, 510, 561), (@skill_id, 6, 1217, 625, 688),
(@skill_id, 7, 1383, 739, 813), (@skill_id, 8, 1549, 80, 890), (@skill_id, 9, 1746, 941, 1041),
(@skill_id, 10, 1912, 1015, 1117)
;



INSERT INTO specialties (level, descr)
VALUES
(8, '+20% MP restored'),
(8, 'Absorbs {percent}% HP'),
(8, '+50% Multi-Hit on hit'),
(12,'-{seconds}s [{skill}] cooldown on hit'),
(16, 'Adds [{skill}] Chain Skill'),
(8, '-20% MP consumed')
;
