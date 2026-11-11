const backendURL = import.meta.env.VITE_BACKEND_URL;

/**
 * 
 * @param {*} tags list of strings
 * @param {*} skills list of skill objects
 */
const getFilteredSkills = async (tags, displayedSkills) => {
    const skills = displayedSkills;
    console.log(skills);

    const response = await fetch(`${backendURL}/filter`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({
            'category': 'tag',
            'options': tags,
            'items': skills
        })
    });

    const {items} = await response.json();
    console.log(items);
    return items;
    
}

export { getFilteredSkills }
