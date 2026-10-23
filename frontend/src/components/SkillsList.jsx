function SkillsList({ tags, tagID, setTagID, skills, id, setID, images }) {
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
                {skills.map((skill, index) => (
                    <button
                        className={skill['id'] === Number(id) ? "selectedSkillcard" : "skillcard"}
                        value={skill['id']}
                        key={index}
                        onClick={(e) => {
                            if (skill['id'] === Number(id)) {
                                setID('');
                            } else {
                                setID(e.currentTarget.value);
                            }
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