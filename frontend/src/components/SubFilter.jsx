import { LuFilter } from "react-icons/lu";
import { useState } from 'react';

import { getFilteredSkills } from "../../api/FilterAPI";

function SubFilter ({skills, setSkills, options, setOptions}) {
    const [menu, setMenu] = useState(false);
    const [optionsQ, setOptionsQ] = useState([]);

    const handleIconClick = () => {
        menu ? setMenu(false) : setMenu(true);
    }

    const handleForm = async (e) => {
        e.preventDefault();
        setMenu(false);
        const newSkills = await getFilteredSkills(optionsQ, skills);
        //console.log(newSkills);
        setSkills(newSkills);
        setOptions(optionsQ);
    }

    const handleCheck = (e) => {
        if (e.target.checked) {
            setOptionsQ(prevOptionsQ => [...prevOptionsQ, e.target.value]);
        } else {
            setOptionsQ(prevOptionsQ => prevOptionsQ.filter(option => option != e.target.value));
        }
    }

    //VALUES ('Physical'), ('Magical'), ('Attack'), ('Buff'), ('Debuff');

    return (
        <div>
            <LuFilter id="filter-icon" onClick={handleIconClick}/>
            <form className={ menu ? "show" : "hide"} id="filter-overlay">
                <b>Skill Tags:</b>
                <br/>
                <div className="filter-options">
                    <input type="checkbox" id="Physical" value="Physical" onChange={handleCheck}/>
                    <label htmlFor="Physical">Physical</label>
                    <br/>
                    <input type="checkbox" id="Magical" value="Magical" onChange={handleCheck}/>
                    <label htmlFor="Magical">Magical</label>
                    <br/>
                    <input type="checkbox" id="Attack" value="Attack" onChange={handleCheck}/>
                    <label htmlFor="Attack">Attack</label>
                    <br/>
                    <input type="checkbox" id="Buff" value="Buff" onChange={handleCheck}/>
                    <label htmlFor="Buff">Buff</label>
                    <br/>
                    <input type="checkbox" id="Debuff" value="Debuff" onChange={handleCheck}/>
                    <label htmlFor="Debuff">Debuff</label>
                </div>
                <button type="submit" onClick={handleForm}>Filter</button>
            </form>
        </div>
    )
    


}

export default SubFilter;