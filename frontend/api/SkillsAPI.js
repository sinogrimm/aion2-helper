const backendURL = import.meta.env.VITE_BACKEND_URL;

const getSkills = async(id) => {
    const res = await fetch(`${backendURL}/skills/${id}`);
    return res.json();
}

export { getSkills }