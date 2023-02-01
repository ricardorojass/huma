import React from 'react';
import { useEffect } from 'react';
import {
  BrowserRouter as Router,
  Routes,
  Route,
} from 'react-router-dom';

const Home = React.lazy(() => import('./components/Home'));
const Product = React.lazy(() => import('./components/Product'));
const Login = React.lazy(() => import('./components/Login'));
const AdminProduct = React.lazy(() => import('./Pages/AdminProduct'));
const AdminProducts = React.lazy(() =>
  import('./Pages/AdminProducts')
);
import { FullPageSpinner } from './components/lib';

const App = () => {
  useEffect(() => {
    console.log('rendered');
  });

  return (
    <React.Suspense fallback={<FullPageSpinner />}>
      <Router forceRefresh={true}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/product/:productId" element={<Product />} />
          <Route
            path="/admin/products/create"
            element={<AdminProduct />}
          />
          <Route path="/admin/products" element={<AdminProducts />} />
        </Routes>
        <footer>This is the footer</footer>
      </Router>
    </React.Suspense>
  );
};

export default App;
