import { useState, useEffect } from 'react';

import ClassDropdown from "../components/ClassDropdown";
import SkillsList from "../components/SkillsList";
import SkillDetails from "../components/SkillDetails";
import { getClasses } from '../../api/ClassAPI';
import { getSkills, getSkillsByTag, getSkillImages } from '../../api/SkillsAPI';
import { getTags } from '../../api/TagAPI';

function SkillsReference() {
    const [classes, setClasses] = useState([]);
    const [selectedClassID, setSelectedClassID] = useState('');

    const [skills, setSkills] = useState([]); // stores all skills of selected class
    const [images, setImages] = useState([]); // stores all images for selected class

    const [tags, setTags] = useState([]);
    const [selectedTagID, setSelectedTagID] = useState('');

    const [displayedSkills, setDisplayedSkills] = useState([]); // stores skills based on filter

    const [selectedSkillID, setSelectedSkillID] = useState('');
    
    const [help, setHelp] = useState(false);


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
                const { skills } = await getSkills(selectedClassID);
                setSkills(skills);
                const images = getSkillImages(skills);
                setImages(images);

                if (selectedTagID != '') {
                    const filteredSkills = getSkillsByTag(skills, Number(selectedTagID));
                    setDisplayedSkills(filteredSkills);

                } else {
                    setDisplayedSkills(skills);
                }

            } else {
                setSkills([]);
                setDisplayedSkills([]);
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
            <div className='topbar'>
                <div className="classview">
                    <h2>Class:</h2>
                    <ClassDropdown classes={classes} id={selectedClassID} setID={setSelectedClassID}/>
                </div>
                <button id='help' onClick={(e) => {
                    if (help) {setHelp(false);}
                    else {setHelp(true);}
                }}>Help</button>
                <ol className={help ? 'show' : 'hide'} id='helpoverlay'>
                    <li>Select class from dropdown.</li>
                    <li>Select tag button to filter by skill type.</li>
                    <li>Click on skill to view details.</li>
                    <li>Input number or move slider to change skill level.</li>
                    <li>Select checkbox to mark specialties.</li>
                </ol>
            </div>
            <div className="skillview">
                <SkillsList 
                    tags={tags} tagID={selectedTagID} setTagID={setSelectedTagID}
                    skills={displayedSkills} id={selectedSkillID} setID={setSelectedSkillID}
                    images={images}
                />
                <SkillDetails skID={selectedSkillID}/>
            </div>
        </div>
    )
} export default SkillsReference;