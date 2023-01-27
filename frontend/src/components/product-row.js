/** @jsx jsx */
import {jsx} from '@emotion/react';
import { Link } from 'react-router-dom';
import { gql, useMutation } from '@apollo/client';
import { GET_CART_ITEMS } from './cart';

const CREATE_CART_ITEM = gql`
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


function ProductRow({product}) {
  const { id, name, description, thumbnail } = product;
  const [createCartItem, { loading, error, data }] = useMutation(
    CREATE_CART_ITEM,
    {
      variables: {productId: id, userId: null},
      refetchQueries: [{ query: GET_CART_ITEMS}]
    }
  );

  const addToCart = async () => {
    try {
      console.log('addToCart');
      const { data } = await createCartItem();
      console.log(data);
    } catch (error) {
      console.log(error);
    }
  }

  if (error) return <p>Error : {error.message}</p>;

  return (
    <div className="flex flex-col mr-3 overflow-hidden rounded-md shadow-sm h-96 w-fit card-compact card bg-base-100">
      <figure><img src={thumbnail} alt={`${product.name}`} /></figure>
      <div className="card-body">
        <Link to={`/product/${product.id}`}
          className="leading-tight hover:link">
          <h2 className="text-lg font-bold leading-none">{product.name}</h2>
          <p className="text-base text-neutral">{product.description}</p>

        </Link>
        <p className="pt-12">${product.salePrice} pesos</p>
        <div className="justify-center card-actions">
          <button
            disabled={loading}
            className="w-full text-base font-bold text-base-100 bg-primary btn bnt-primary"
            onClick={addToCart}>Añadir al carrito</button>
        </div>
      </div>
    </div>
  )
}

export {ProductRow}