import {useState} from 'react';
import reactLogo from './assets/react.svg';
import webmanLogo from './assets/webman.svg';
import './App.css';
import {Link} from 'react-router-dom';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="App">
      <div>
        <a href="https://www.workerman.net/webman" target="_blank">
          <img src={webmanLogo} className="logo webman" alt="Webman logo" />
        </a>
        <a href="https://reactjs.org" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
        <a href="https://vitejs.dev" target="_blank">
          <img src="/vite.svg" className="logo" alt="Vite logo" />
        </a>
      </div>
      <h1>Webman + React + Vite</h1>
      <Link to="/hello">Move to /hello</Link>
      <div className="card">
        <button onClick={() => setCount(count => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Webman, React, and Vite logos to learn more
      </p>
    </div>
  );
}

export default App;
