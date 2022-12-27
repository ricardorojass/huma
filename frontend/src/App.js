import * as React from "react"
import { useEffect } from "react"
import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom"

const App = () => {
  useEffect(() => {
    console.log('rendered');
  })

    return (
      <React.Fragment>
        <h1>HUMA STORE</h1>
      </React.Fragment>
    )
}

export default App;