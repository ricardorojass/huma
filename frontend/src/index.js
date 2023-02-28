import * as React from "react";
import "./bootstrap";
import { endpoint, prodEndpoint } from "../config";
import App from "./App";
import tokenStorage from "@lib/tokenStorage";
import { HashRouter } from "react-router-dom";
import { CartStateProvider } from "./contexts/cartState";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
// import queryClient from "@queries/queryClient";
const queryClient = new QueryClient();

import { createRoot } from "react-dom/client";
const container = document.getElementById("root");
const root = createRoot(container);
root.render(
  <QueryClientProvider client={queryClient}>
    <CartStateProvider>
      <App />
    </CartStateProvider>
    <ReactQueryDevtools />
  </QueryClientProvider>
);
