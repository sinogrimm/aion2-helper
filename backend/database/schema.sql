DROP TABLE IF EXISTS skill_relations;
DROP TABLE IF EXISTS skill_specialties;
DROP TABLE IF EXISTS specialties;
DROP TABLE IF EXISTS skill_levels;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS classes;

-- category table
-- 1:m relationship between classes and skills
CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL
);

-- category table
-- currently 1:m relationship between tags and skills
-- may become m:m relationship in the future
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- entity table
-- m:1 relationship between skills and classes
-- m:1 relationship between skills and tags
-- currently does not include cast times due to handling of charges
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL,
    brief_descr varchar(255) NOT NULL,
    detailed_descr TEXT NOT NULL,
    cooldown INT NOT NULL DEFAULT 0,
    lv_unlock INT NOT NULL DEFAULT 1,
    class_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);
-- the amount needed to upgrade each skill from 1 to 10 stays the same
-- so it will be handled by a constant array
-- skill_costs = [0, 1, 2, 3, 5, 7, 9, 13, 17, 21]

-- for storing the damage ranges of the skill depending on the level
-- m:1 relationship between skill_levels and skills
CREATE TABLE skill_levels (
    skill_id INT NOT NULL,
    level INT NOT NULL,
    min_dmg INT NOT NULL,
    max_dmg INT,
    PRIMARY KEY (skill_id, level),
    FOREIGN KEY (skill_id) REFERENCES skills(id)
);

-- for the sake of simplicity, specialties will not actually be level locked
-- but they are stored for convenience
-- m:m relationship between specialties and skills
CREATE TABLE specialties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level INT NOT NULL,
    descr varchar(200) UNIQUE NOT NULL
);

-- intersection table
-- m:m relationship between skills and specialties
-- each skill has 5 specialties
-- multiple skill may have the same specialty
CREATE TABLE skill_specialties (
    skill_id INT NOT NULL,
    specialty_id INT NOT NULL,
    PRIMARY KEY (skill_id, specialty_id),
    FOREIGN KEY (skill_id) REFERENCES skills(id),
    FOREIGN KEY (specialty_id) REFERENCES specialties(id)
);

-- intersection table
-- self referential m:m relationship within skills
-- a skill can be related to other skills
CREATE TABLE skill_relations (
    skill_id INT NOT NULL,
    related_skill_id INT NOT NULL,
    PRIMARY KEY (skill_id, related_skill_id),
    FOREIGN KEY (skill_id) REFERENCES skills(id),
    FOREIGN KEY (related_skill_id) REFERENCES skills(id)
);
