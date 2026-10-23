import { useState, useEffect } from 'react';


import ClassDropdown from "../components/ClassDropdown";
import SkillsList from "../components/SkillsList";
import SkillDetails from "../components/SkillDetails";
import { getClasses } from '../../api/ClassAPI';
import { getSkills, getSkillsByTag } from '../../api/SkillsAPI';
import { getTags } from '../../api/TagAPI';

function SkillsReference() {
    const [classes, setClasses] = useState([]);
    const [selectedClassID, setSelectedClassID] = useState('');

    const [skills, setSkills] = useState([]); // stores all skills of selected class

    const [tags, setTags] = useState([]);
    const [selectedTagID, setSelectedTagID] = useState('');

    const [displayedSkills, setDisplayedSkills] = useState([]); // stores skills based on filter

    const [selectedSkillID, setSelectedSkillID] = useState('');
    

    const loadDropdown = async() => {
        try {
            const { classes } = await getClasses();
            setClasses(classes);

        } catch (err) {
            console.log(`Failed to load class dropdown: ${err.message}`);
        }
    }

    const loadFilter = async() => {
        try {
            const { tags } = await getTags();
            setTags(tags);
        } catch (err) {
            console.log(`Failed to load filter buttons: ${err.message}`);
        }
    }

    const loadSkillsList = async() => {
        try {
            if (selectedClassID != '') {

                if (selectedTagID != '') {
                    const filteredSkills = getSkillsByTag(skills, Number(selectedTagID));
                    setDisplayedSkills(filteredSkills);

                } else {
                    const { skills } = await getSkills(selectedClassID);
                    setSkills(skills);
                    setDisplayedSkills(skills);
                }

            } else {
                setSkills([]);
            }
        } catch (err) {
            console.log(`Failed to load skills list: ${err.message}`);
        }
    }

    useEffect(() => {
        loadDropdown();
        loadFilter();
        loadSkillsList();
    }, [selectedClassID, selectedTagID]);


    return (
        <div className="content">
            <h1>Skills Reference Tool</h1>
            <p>
                Explore combat skills for different classes in AION2 to figure out how they work
                 together and how much investment makes an impact.
            </p>
            <div className="classview">
                <h2>Class:</h2>
                <ClassDropdown classes={classes} id={selectedClassID} setID={setSelectedClassID}/>
            </div>
            <div className="skillview">
                <SkillsList 
                    tags={tags} tagID={selectedTagID} setTagID={setSelectedTagID}
                    skills={displayedSkills} id={selectedSkillID} setID={setSelectedSkillID}

                />
                <SkillDetails/>
            </div>
        </div>
    )
} export default SkillsReference;