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

export { getSkills, getSkillsByTag, getSkillImages }