import React from 'react';
import { Routes, Route } from 'react-router-dom';

// Pages
import Skills from './pages/Skills';


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
                <Route path="/" element={<Skills />} />
            </Routes>
        </>
    );

} export default App;