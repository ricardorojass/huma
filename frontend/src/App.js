import React, { lazy, Suspense } from "react";
import { useEffect } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

const Home = lazy(() => import("./components/Home"));
const Product = lazy(() => import("./components/Product"));
const Login = lazy(() => import("./components/Login"));
const AdminProduct = lazy(() => import("./Pages/AdminProduct"));
const AdminProducts = lazy(() => import("./Pages/AdminProducts"));
import { FullPageSpinner } from "./components/lib";

const App = () => {
  return (
    <Suspense fallback={<FullPageSpinner />}>
      <Router forceRefresh={true}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/product/:productId" element={<Product />} />
          <Route path="/admin/products/create" element={<AdminProduct />} />
          <Route path="/admin/products" element={<AdminProducts />} />
        </Routes>
        <footer>This is the footer</footer>
      </Router>
    </Suspense>
  );
};

export default App;
