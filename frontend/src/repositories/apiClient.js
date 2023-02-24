import { ACCESS_TOKEN_KEY } from "@constants/token.constant";
import tokenStorage from "@lib/tokenStorage";

import axios from "axios";

const host = "http://localhost:3000/api";

const apiClient = axios.create({
  baseURL: host,
});

const logOnDev = () => {
  if (process.env.NODE_ENV === "development") {
    console.log("message, log");
  }
};

apiClient.interceptors.request.use((request) => {
  const jwtToken = tokenStorage.read(ACCESS_TOKEN_KEY);
  const { method, url } = request;

  if (jwtToken) {
    request.headers["Authorization"] = `Token ${jwtToken}`;
  }

  logOnDev(`🚀 [${method?.toUpperCase()}] ${url} | Request`, request);

  return request;
});

apiClient.interceptors.response.use(
  (response) => {
    const { method, url } = response.config;
    const { status } = response;

    logOnDev(
      `✨ [${method?.toUpperCase()}] ${url} | Response ${status}`,
      response
    );

    return response;
  },
  (error) => {
    console.log("error", error);
    // const { message } = error;
    const { status, data } = error.response;
    const { method, url } = error.config;

    logOnDev(
      `🚨 [${method?.toUpperCase()}] ${url} | Error ${status} ${
        data?.message || ""
      } | ${message}`,
      error
    );

    return Promise.reject(error);
  }
);

export default apiClient;
