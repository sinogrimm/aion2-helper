const backendURL = import.meta.env.VITE_BACKEND_URL;

const getSkills = async(id) => {
    const res = await fetch(`${backendURL}/skills/${id}`);
    return res.json();
}

// will be implemented with filter microservice in the next sprint
const getSkillsByTag = (skills, tag_id) => {
    let filteredSkills = [];

    for (let i = 0; i < skills.length; ++i) {
        let currID = skills[i]['tag_id'];
        if (currID === tag_id) {
            filteredSkills.push(skills[i]);
        }
    }

    return filteredSkills;
}

// will be implemented with image microservice in next sprint
const getSkillImages = (skills) => {
    let images = {};

    for (let i = 0; i < skills.length; ++i) {
        let id = skills[i]['id'];
        let path = skills[i]['name'].toLowerCase().replaceAll(' ', '_');
        images[id] = `/${path}.webp`
    }

    return images;
}

const getSkill = async (id) => {
    // wait for HTTP response
    const res = await fetch(`${backendURL}/skill/${id}`);

    // wait for parsed json of response
    // receiving {"skills": [{key: value}]}
    // destructure object, then array
    const {skill: [skill]} = await res.json();
    //console.log(skill);

    return skill;
}

const getImage = (skName) => {
    const path = skName.toLowerCase().replaceAll(' ', '_');
    const image = `/${path}.webp`;
    return image;
}

const getLvInfo = async (skID) => {
    const res = await fetch(`${backendURL}/lvinfo/${skID}`);
    const {lvInfo} = await res.json();
    //console.log(lvInfo);

    return lvInfo;
}

const getSpecs = async (skID) => {
    const res = await fetch(`${backendURL}/skSpecs/${skID}`);
    let {specs} = await res.json();
    
    if (specs[0]['descr'] === null) {
        specs = [];
    }
    //console.log(specs);
    return specs;
}

export { getSkills, getSkillsByTag, getSkillImages,
    getSkill, getImage, getLvInfo, getSpecs }