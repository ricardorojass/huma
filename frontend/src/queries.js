import { gql } from '@apollo/client';

export const GET_PRODUCT = gql`
  query Product ($productId: ID!) {
    product(id: $productId) {
      name
      description
      salePrice
    }
  }
`;

export const GET_PRODUCTS = gql`
  query  {
    products {
      id
      name
      description
      costPrice
      salePrice
      thumbnail
      active
      category {
        name
      }
    }
  }
`;
