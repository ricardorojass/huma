import * as React from "react"
import { useEffect } from "react"
import {
  BrowserRouter as Router,
  Routes,
  Route
} from "react-router-dom"

import Header from './components/Header'
import Shop from './Pages/Shop'
import Product from './Pages/Product'

const App = () => {

  useEffect(() => {
    console.log('rendered')
  })

  return (
    <React.Fragment>
      <Router forceRefresh={true}>
        <Header title="Huma"/>
        <Routes>
          <Route path="/" element={<Shop />} />
          <Route path="/product/:productId" element={<Product />} />
        </Routes>
        <footer>This is the footer</footer>
      </Router>
    </React.Fragment>
  )
}

export default App;