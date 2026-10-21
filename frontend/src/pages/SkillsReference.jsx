
import ClassDropdown from "../components/ClassDropdown";
import SkillsList from "../components/SkillsList";
import SkillDetails from "../components/SkillDetails";

function SkillsReference() {
    return (
        <div className="content">
            <h1>Skills Reference</h1>
            <p>
                Explore combat skills for different classes in AION2 to figure out how they work
                 together and how much investment makes an impact.
            </p>
            <div className="classview">
                <h2>Class:</h2>
                <ClassDropdown/>
            </div>
            <div className="skillview">
                <SkillsList/>
                <SkillDetails/>
            </div>
        </div>
    )
} export default SkillsReference;