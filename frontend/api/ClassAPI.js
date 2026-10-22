const backendURL = import.meta.env.VITE_BACKEND_URL;

const getClasses = async() => {
    const res = await fetch(`${backendURL}/class-dropdown`);
    return res.json();
}

export { getClasses }