%%raw(`
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import {make as App} from './App.bs';
`)

// @module("./reportWebVitals") external ....
// #=> import reportWebVitals from ./reportWebVitals";
//
// @module("./yyy") external hogehoge: zzz
// #=> var hogehoge = yyy;
//
@module("./reportWebVitals") external reportWebVitals: 'whatever = "default"

// ReScript
let rootQuery = ReactDom.querySelector("#root")
switch rootQuery {
| None => ()
| Some(root) => ReactDOM.render(<App />, root)
}
// Same js
//const root = document.getElementById('root');
//if (root)
//ReactDOM.render(
//  <React.StrictMode>
//    <App />
//  </React.StrictMode>,
//  root
//)

reportWebVitals()
