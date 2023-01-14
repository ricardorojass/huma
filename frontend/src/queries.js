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
