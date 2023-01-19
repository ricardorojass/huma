import * as React from 'react'
import './bootstrap'
import {
  ApolloProvider,
  InMemoryCache,
  ApolloClient,
  ApolloLink,
} from '@apollo/client';
import { onError } from '@apollo/client/link/error';
import { createUploadLink } from 'apollo-upload-client';
import { endpoint, prodEndpoint } from '../config';
import App from "./App";

const cache = new InMemoryCache()
const link = createUploadLink({
  uri: process.env.NODE_ENV === 'development' ? endpoint : prodEndpoint
});
const onErrorLink = onError(({ graphQLErrors, networkError }) => {
  if (graphQLErrors)
    graphQLErrors.forEach(({ message, locations, path }) =>
      console.log(
        `[GraphQL error]: Message: ${message},
          Location: ${locations}, Path: ${path}`,
      ),
    );
  if (networkError) console.log(`[Network error]: ${networkError},
    backend is unreachable. Is it running?`);
});

const client = new ApolloClient({
  cache,
  link: onErrorLink.concat(link),
});

import { createRoot } from 'react-dom/client'
const container = document.getElementById('root')
const root = createRoot(container)
root.render(
  <ApolloProvider client={client}>
    <App/>
  </ApolloProvider>
)