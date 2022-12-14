import React from 'react';
import ReactDOM from 'react-dom/client';
import {BrowserRouter, Link, Route, Routes} from 'react-router-dom';
import App from './App';
import './index.css';

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route
          path="/hello"
          element={
            <>
              <div>Hello, reactman.</div>
              <hr />
              <Link to="/">Go back to /</Link>
            </>
          }
        />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>,
);
