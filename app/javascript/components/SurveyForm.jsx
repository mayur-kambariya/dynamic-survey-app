import React, { useEffect, useState } from 'react';
import axios from 'axios';

const SurveyForm = () => {
  // State to hold the survey data
  const [survey, setSurvey] = useState(null);
  // State to hold user responses
  const [responses, setResponses] = useState({});
  const userId = 1; // assuming seeded user

  // useEffect to fetch survey data when the component mounts
  useEffect(() => {
    axios.get('/api/v1/surveys/1.json').then((res) => {
      setSurvey(res.data);
    });
  }, []);

  // Function to handle changes in the response inputs
  const handleChange = (questionId, categoryId, answerId, score) => {
    setResponses({
      ...responses,
      [questionId]: { question_id: questionId, category_id: categoryId, answer_id: answerId, score }
    });
  };

  // Function to handle form submission
  const handleSubmit = async () => {
    const payload = {
      user_id: userId,
      survey_id: survey.id,
      question_answer_object: Object.values(responses)
    };
    await axios.post('/api/v1/survey_responses', payload);
    alert('Survey submitted!');
  };

  // Loading state while the survey data is being fetched
  if (!survey) return <p>Loading...</p>;

  return (
    <div className="survey-form-container">
      {/* Survey title section */}
      <h2 className="survey-title">{survey.title}</h2>
      {survey.categories.map((cat) => (
        <div key={cat.id} className="survey-category">
          {/* Category title section */}
          <h4 className="category-title">{cat.name}</h4>
          <table className="survey-table">
            <thead>
              <tr className="table-header">
                {/* Table header for questions */}
                <th className="table-cell question-header">Question</th>
                {cat.questions[0]?.options.map((opt) => (
                  <th key={opt.id} className="table-cell">{opt.text}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {cat.questions.map((q, qIdx) => (
                <tr key={q.id} className={`table-row ${qIdx % 2 === 0 ? 'even-row' : 'odd-row'}`}>
                  {/* Question text cell */}
                  <td className="table-cell">{q.text}</td>
                  {cat.questions[0]?.options.map((opt) => (
                    <td key={opt.id} className="table-cell">
                      {/* Radio input for each response option */}
                      <input
                        type="radio"
                        name={`question-${q.id}`}
                        value={opt.id}
                        onChange={() => handleChange(q.id, q.category_id, opt.id, opt.score)}
                      />
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ))}
      {/* Submit button section */}
      <div className="submit-container">
        <button onClick={handleSubmit} className="submit-button">Submit</button>
      </div>
    </div>
  );
};

export default SurveyForm;