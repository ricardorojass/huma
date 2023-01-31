import { gql } from '@apollo/client';

export const GET_PRODUCT = gql`
  query Product ($productId: ID!) {
    product(id: $productId) {
      name
      description
      salePrice
      thumbnail
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

export const GET_CART_ITEMS = gql`
  query {
    cartItems {
      id
      userId
      quantity
      product {
        id
        name
        salePrice
        thumbnail
      }
    }
  }
`

export const CREATE_CART_ITEM = gql`
  mutation CreateCartItem(
    $userId: ID
    $productId: ID!
  ) {
    createCartItem(
      input: {
        userId: $userId
        productId: $productId
      }
    ) {
      cartItem {
        id
        quantity
      }
      errors
    }
  }
`;
