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

export const GET_PRODUCTS_BY_CATEGORY = gql`
  query Category($name: String!) {
    category(name: $name) {
      id
      name
      products {
        id
        name
        description
        salePrice
        thumbnail
      }
    }
  }
`
