const ClassDropdown = ({ classes, id, setID }) => {
    return (
        <select
            className="dropdown"
            value={id}
            onChange={(e) => {
                setID(e.target.value)
            }}
        >
            <option value="">-- Select --</option>
            {classes.map((cls, index) => (
                <option value={cls['id']} key={index}>{cls['name']}</option>
            ))}
        </select>
    )
}

export default ClassDropdown;