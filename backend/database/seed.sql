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
        'Deals {min_dmg} damage to up to 4 enemies within 4m and increases Enmity.',
        'Restores 100MP.'
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
)
;

-- to reduce the amount of data to process,
-- skill levels will only go up to 10 instead of 20

SET @skill_id = (SELECT id FROM skills WHERE name = 'Vicious Strike');

INSERT INTO skill_levels (skill_id, level, min_dmg, max_dmg)
VALUES
(@skill_id, 1, 79, 79), (@skill_id, 2, 118, 118), (@skill_id, 3, 158, 158),
(@skill_id, 4, 198, 198), (@skill_id, 5, 258, 258), (@skill_id, 6, 332, 332),
(@skill_id, 7, 420, 420), (@skill_id, 8, 494, 494), (@skill_id, 9, 568, 568),
(@skill_id, 10, 642, 642)
;

SET @skill_id = (SELECT id FROM skills WHERE name = 'Pummel');

INSERT INTO skill_levels (skill_id, level, min_dmg, max_dmg)
VALUES
(@skill_id, 1, 93, 93), (@skill_id, 2, 143, 143), (@skill_id, 3, 193, 193),
(@skill_id, 4, 243, 243), (@skill_id, 5, 318, 318), (@skill_id, 6, 412, 412),
(@skill_id, 7, 523, 523), (@skill_id, 8, 616, 616), (@skill_id, 9, 709, 709),
(@skill_id, 10, 802, 802)
;

SET @skill_id = (SELECT id FROM skills WHERE name = 'Poach');

INSERT INTO skill_levels (skill_id, level, min_dmg, max_dmg)
VALUES
(@skill_id, 1, 49, 49), (@skill_id, 2, 86, 86), (@skill_id, 3, 123, 123),
(@skill_id, 4, 160, 160), (@skill_id, 5, 215, 215), (@skill_id, 6, 283, 283),
(@skill_id, 7, 364, 364), (@skill_id, 8, 433, 433), (@skill_id, 9, 501, 501),
(@skill_id, 10, 569, 569)
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

INSERT INTO skill_specialties (skill_id, specialty_id)
SELECT skills.id, specialties.id
FROM skills CROSS JOIN specialties
WHERE skills.name = 'Vicious Strike' AND specialty.descr IN (
    '+20% MP restored',
    'Absorbs 1% HP',
    '+50% Mult-Hit on hit',
    '-2s [Warding Strike] cooldown on hit',
    'Adds [Threatening Blow] Chain Skill'
);