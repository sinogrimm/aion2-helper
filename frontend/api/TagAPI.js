const backendURL = import.meta.env.VITE_BACKEND_URL;

const getTags = async() => {
    const res = await fetch(`${backendURL}/tags`);
    return res.json();
}

export { getTags }