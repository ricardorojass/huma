import * as React from "react"
import { useEffect } from "react"
import {
  BrowserRouter as Router,
  Routes,
  Route
} from "react-router-dom"

const Header = React.lazy(() => import('./components/Header'))
const Shop = React.lazy(() => import('./Pages/Shop'))
const Product = React.lazy(() => import('./Pages/Product'))
const AdminProduct = React.lazy(() => import('./Pages/AdminProduct'))
const AdminProducts = React.lazy(() => import('./Pages/AdminProducts'))
import { FullPageSpinner } from './components/lib'

const App = () => {

  useEffect(() => {
    console.log('rendered')
  })

  return (
    <React.Suspense fallback={<FullPageSpinner />}>
      <Router forceRefresh={true}>
        <Header title="Huma"/>
        <Routes>
          <Route path="/" element={<Shop />} />
          <Route path="/product/:productId" element={<Product />} />
          <Route path="/admin/products/create" element={<AdminProduct />} />
          <Route path="/admin/products" element={<AdminProducts />} />
        </Routes>
        <footer>This is the footer</footer>
      </Router>
    </React.Suspense>
  )
}

export default App;