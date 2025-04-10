import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import SurveyForm from "./SurveyForm";
import KpiDashboard from "./KpiDashboard";

const App = () => {
  return (
    <Router>
      <div style={{ padding: "1rem" }}>
        <nav style={{ marginBottom: "1rem" }}>
          <Link to="/" style={{ marginRight: "1rem" }}>Home</Link>
          <Link to="/survey">Take Survey</Link>
        </nav>
        <Routes>
          <Route path="/" element={<KpiDashboard />} />
          <Route path="/survey" element={<SurveyForm />} />
        </Routes>
      </div>
    </Router>
  );
};

export default App;