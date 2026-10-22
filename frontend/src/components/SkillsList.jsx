function SkillsList({ skills, id, setID }) {
    return (
        <div className="column">
            <h3>Skills</h3>
            <hr/>
            <div className="filterbar">
                <button>Active</button>
                <button>Passive</button>
                <button>Stigma</button>
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
                        <p>{skill['name']}</p>
                        <p>{skill['brief_descr']}</p>
                    </button>
                ))}
            </div>
            

        </div>
    )
}

export default SkillsList;