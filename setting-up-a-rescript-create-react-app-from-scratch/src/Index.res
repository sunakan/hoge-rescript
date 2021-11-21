%%raw(`import './index.css';`)
@module("./reportWebVitals") external reportWebVitals: unit => unit = "default"
let rootQuery = ReactDOM.querySelector("#root")
switch rootQuery {
| None => ()
| Some(root) => ReactDOM.render(<App />, root)
}
reportWebVitals()
