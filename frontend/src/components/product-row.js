/** @jsx jsx */
import {jsx} from '@emotion/react';
import { Link } from 'react-router-dom';
import { gql, useMutation } from '@apollo/client';

function ProductRow({product}) {
  const { id, name, description, thumbnail } = product;

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
      </div>
    </div>
  )
}

export {ProductRow}