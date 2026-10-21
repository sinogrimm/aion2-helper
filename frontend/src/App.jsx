import './App.css';

import React from 'react';
import { Routes, Route } from 'react-router-dom';

// Pages
import SkillsReference from './pages/SkillsReference';


// Components
import Navigation from './components/Navigation';

// Define the backend port and URL for API requests
const backendPort = 5162;  // Use the port you assigned to the backend server, this would normally go in a .env file
const backendURL = `localhost:${backendPort}`;

function App() {

    return (
        <>
            <Navigation />
            <Routes>
                <Route path="/" element={<SkillsReference />} />
            </Routes>
        </>
    );

} export default App;