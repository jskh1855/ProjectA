import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

function test() {
  //alert("Great Shot!");
  const response = axios.get("http://localhost:7777/test");
  alert(response);
}

const myelement = (
  <button onClick={test}>Project A Test</button>
); 

	



ReactDOM.render(myelement, document.getElementById('root'));
