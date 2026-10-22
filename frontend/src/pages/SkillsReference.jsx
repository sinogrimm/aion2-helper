import { useState, useEffect } from 'react';


import ClassDropdown from "../components/ClassDropdown";
import SkillsList from "../components/SkillsList";
import SkillDetails from "../components/SkillDetails";
import { getClasses } from '../../api/ClassAPI';
import { getSkills } from '../../api/SkillsAPI';

function SkillsReference() {
    const [classes, setClasses] = useState([]);
    const [selectedClassID, setSelectedClassID] = useState('');
    const [skills, setSkills] = useState([]);
    const [selectedSkillID, setSelectedSkillID] = useState('');

    const loadDropdown = async() => {
        try {
            const { classes } = await getClasses();
            setClasses(classes);

        } catch (err) {
            console.log(`Failed to load class dropdown: ${err.message}`);
        }
    }

    const loadSkillsList = async() => {
        try {
            if (selectedClassID != '') {
                const { skills } = await getSkills(selectedClassID);
                setSkills(skills);
                console.log(skills);
            } else {
                setSkills([]);
            }
        } catch (err) {
            console.log(`Failed to load skills list: ${err.message}`);
        }
    }

    useEffect(() => {
        loadDropdown();
        loadSkillsList();
    }, [selectedClassID]);


    return (
        <div className="content">
            <h1>Skills Reference</h1>
            <p>
                Explore combat skills for different classes in AION2 to figure out how they work
                 together and how much investment makes an impact.
            </p>
            <div className="classview">
                <h2>Class:</h2>
                <ClassDropdown classes={classes} id={selectedClassID} setID={setSelectedClassID}/>
            </div>
            <div className="skillview">
                <SkillsList skills={skills} id={selectedSkillID} setID={setSelectedSkillID}/>
                <SkillDetails/>
            </div>
        </div>
    )
} export default SkillsReference;