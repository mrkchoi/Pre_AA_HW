import React from 'react';
import ReactDOM from 'react-dom';
import Calculator from './components/calculator';


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Calculator/>, root);
});
