import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
} from 'chart.js';

// Registering necessary components for Chart.js
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const KpiDashboard = () => {
  const [averages, setAverages] = useState({}); // State to hold average scores per category
  const [engagement, setEngagement] = useState(0); // State to hold engagement index
  const [highPerf, setHighPerf] = useState(0); // State to hold high performer percentage

  useEffect(() => {
    // Fetching KPI data from the API when the component mounts
    axios.get('/api/v1/kpi_dashboard.json').then((res) => {
      const { averages, engagement_index, high_performer_percent } = res.data;
      setAverages(averages);
      setEngagement(engagement_index);
      setHighPerf(high_performer_percent);
    });
  }, []);

  // Structure of chartData for the Bar chart
  const chartData = {
    labels: Object.keys(averages),
    datasets: [
      {
        label: 'Average Score per Category',
        data: Object.values(averages),
        backgroundColor: 'rgba(54, 162, 235, 0.6)',
        borderRadius: 5
      }
    ]
  };

  // Structure of chartOptions for customizing the Bar chart
  const chartOptions = {
    responsive: true,
    plugins: {
      legend: { display: true },
      title: {
        display: true,
        text: 'Category Scores'
      }
    }
  };

  return (
    <div>
      <h2>KPI Dashboard</h2>
      <p><strong>Engagement Index:</strong> {engagement}</p>
      <p><strong>High Performers (%):</strong> {highPerf}</p>
      <Bar data={chartData} options={chartOptions} />
    </div>
  );
};

export default KpiDashboard;