import { useState, useEffect } from 'react';
import { getSkill, getImage, getLvInfo, getSpecs } from '../../api/SkillsAPI';

function SkillDetails({ skID }) {

    const [skill, setSkill] = useState({});
    const [image, setImage] = useState([]);
    const [level, setLevel] = useState('1');
    const [input, setInput] = useState('');
    const [lvInfo, setLvInfo] = useState([]);
    const [detail, setDetail] = useState('');
    const [specs, setSpecs] = useState([]);
    const [cd, setCd] = useState('');


    const cost = [0, 1, 2, 3, 5, 7, 9, 13, 17, 21];

    const fillDescription = (skill, lv, info) => {
        let newValues = info[lv - 1];
        let fillValues = [];
        //console.log(newValues);
        for (const key of Object.keys(newValues)) {
            if (newValues[key] != null) {
                fillValues.push(newValues[key]);
            }
        }
        //console.log(fillValues);

        let sections = skill['detailed_descr'].split("X")
        //console.log(sections);
        //let newDescr = skill['detailed_descr'];
        let detail = [];
        detail.push(sections[0])
        for (let i = 0; i < fillValues.length; ++i) {
            //newDescr = newDescr.replace("X", String(fillValues[i]));
            //console.log(newDescr);
            detail.push(<span className='red' key={i}>{fillValues[i]}</span>);
            detail.push(sections[i + 1]);
        }
        //console.log(detail);
        setDetail(detail);
        //console.log(newDescr);
    }

    const loadDetails = async() => {
        try {
            if (skID) {
                const skill = await getSkill(skID);
                //console.log(skill);
                setSkill(skill);
                setCd(skill['cooldown']);

                const image = getImage(skill['name']);
                //console.log(image);
                setImage(image);

                setLevel('1');
                setInput('1');

                //console.log(skill['detailed_descr']);
                const lvInfo = await getLvInfo(skID);
                //console.log(lvInfo);
                setLvInfo(lvInfo);

                fillDescription(skill, 1, lvInfo);

                const specs = await getSpecs(skID);
                setSpecs(specs);
                //console.log(specs);
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

        fillDescription(skill, newLevel, lvInfo);
    }

    const changeCooldown = (e, description) => {
        if (e.target.checked) {
            if (description === 'Remove cooldown') {
                setCd(<span className='blue'>0</span>);
            } else {
                if (description.length === 12 || description.length === 13) {
                    let num = description[1];
                    let match = description[0] ;
                    if (description.length === 12) {
                        match += description.slice(2);
                    }
                    if (description.length === 13) {
                        num += description[2];
                        match += description.slice(3)
                    }
                    //console.log(num, match);
                    if (match === '-s cooldown') {
                        setCd(<span className='blue'>{skill['cooldown'] - Number(num)}</span>)
                    }
                }
            }
        } else {
            setCd(skill['cooldown']);
        }
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
                    <p id="changeable" className='bartext'>{cost[level - 1]}</p>
                </div>
            </div>
            <hr/>
            <p className='details'>{detail}</p>
            <p className='details'>Cooldown: {cd}s</p>
            <hr/>
            <div className='details'>
                {specs.map((spec, index) => (
                    <div key={spec['id']}>
                        <input type='checkbox' id={spec['id']}
                            onChange={(e) => changeCooldown(e, spec['descr'])}
                        />
                        <label htmlFor={spec['id']}>{spec['descr']}</label>
                    </div>
                ))}
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