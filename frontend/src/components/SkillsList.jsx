import { useState, useMemo, useTransition } from 'react';

function SkillsList({ tags, tagID, setTagID, skills, id, setID, images }) {
    const [pop, setPop] = useState(false);
    const [checked, setChecked] = useState(false);
    const [click, setClick] = useState(0);
    const [hostage, setHostage] = useState(0);

    ///const handleSkSelect = (e)

    return (
        <div className="column">
            <h3>Skills</h3>
            <hr/>
            <div className="filterbar">
                {tags.map((tag, index) => (
                    <button
                        className={tag['id'] === Number(tagID) ? "selectedFilter" : "filterbutton"}
                        value={tag['id']}
                        key={index}
                        onClick={(e) => {
                            if (tag['id'] === Number(tagID)) {
                                setTagID('');
                            } else {
                                setTagID(e.currentTarget.value);
                            }
                        }}
                    >{tag['name']}</button>
                ))}
            </div>
            <div className="skillslist">
                <div className={pop ? 'show' : 'hide'} id='alertoverlay'>
                    <p>Changes made will be lost upon deselecting a skill or selecting a different skill. Continue?</p>
                    <input type='checkbox' id='understood'
                        onChange={(e) => {if (e.target.checked) {setChecked(true);}}}
                    />
                    <label htmlFor='understood'>Do not show again.</label>
                    <br/>
                    <button className='popbutton' onClick={(e) => {
                        setID(hostage);
                        setPop(false);
                    }}>OK</button>
                    <button className='popbutton' onClick={(e) => {setPop(false);
                    }}>Cancel</button>
                </div>
                {skills.map((skill, index) => (
                    <button
                        className={skill['id'] === Number(id) ? "selectedSkillcard" : "skillcard"}
                        value={skill['id']}
                        key={index}
                        onClick={(e) => {
                            if (!checked && click > 0) {
                                if (skill['id'] === Number(id)) { setHostage(''); }
                                else { setHostage(e.currentTarget.value); }
                                setPop(true);
                            } else {
                                if (skill['id'] === Number(id)) { setID(''); }
                                else { setID(e.currentTarget.value); }
                            }
                            setClick(click + 1);
                        }}
                    >
                        <img src={images[skill['id']]} className="skillcardImage"/>
                        <div className="skillPreview">
                            <p>{skill['name']}</p>
                            <p>{skill['brief_descr']}</p>
                        </div>
                    </button>
                ))}
            </div>
            

        </div>
    )
}

export default SkillsList;