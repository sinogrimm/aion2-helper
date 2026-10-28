import { useState, useEffect, useMemo } from 'react';
import { getSkill, getImage } from '../../api/SkillsAPI';

function SkillDetails({ skID }) {

    const [skill, setSkill] = useState({});
    const [image, setImage] = useState([]);
    const [level, setLevel] = useState('1');
    const [input, setInput] = useState('');

    const cost = [0, 1, 2, 3, 5, 7, 9, 13, 17, 21];

    const loadDetails = async() => {
        try {
            if (skID) {
                const skill = await getSkill(skID);
                //console.log(skill);
                setSkill(skill);

                const image = getImage(skill['name']);
                //console.log(image);
                setImage(image);
                
                setLevel('1');
                setInput('1');
            }
        } catch (err) {
            console.log(`Failed to load skill details: ${err}`)
        }
    }

    const changeLevel = (e) => {
        let newLevel = e.target.value;
        if (newLevel < 1) { newLevel = 1; }
        if (newLevel > 10) { newLevel = 10; }
        setLevel(newLevel);
        setInput(newLevel);
    }

    useEffect(() => {
        loadDetails();
    }, [skID])

    if (skID) {
        return (
        <div className="column">
            <h3>Skill Details</h3>
            <hr/>
            <div className='bar'>
                <img id="skImg" src={image}/>
                <p>{skill['name']}</p>
            </div>
            
            <hr/>
            <div className='levelbar'>
                <div className='bar'>
                    <p className='bartext'>Lv.</p>
                    <input id="lvInput" type="number" value={input}
                        onChange={(e) => {setInput(e.target.value)}}
                        onKeyDown={(e) => {
                            if (e.key === "Enter") {
                                changeLevel(e);
                                e.target.blur();
                            }
                        }}
                    />
                    <input
                        type="range" min="1" max="10" step="1" value={level}
                        onChange={changeLevel}
                        />
                </div>
                <div className='bar'>
                    <img className="currency" src="/wisdom_stone.webp"/>
                    <p className='bartext'>{cost[level - 1]}</p>
                </div>
            </div>
            <hr/>
            <p className='details'>{skill["detailed_descr"]}</p>
            <p className='details'>Cooldown: {skill['cooldown']}s</p>
            <hr/>
            <div className='details'>
                <input type='checkbox' id='spec1'/>
                <label htmlFor='spec1'>specialties</label>
            </div>
            <hr/>
            <div>
                <button>related skills</button>
            </div>
            
        </div>
    )}
    return (
        <div className="column">
            <h3>Skill Details</h3>
            <hr/>
        </div>
    )
}

export default SkillDetails;