/** @jsx jsx */
import {jsx} from '@emotion/react';
import { ProductRow } from './product-row';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS_BY_CATEGORY } from '../queries';

function ListProductList({category}) {
  const { loading, error, data } = useQuery(
    GET_PRODUCTS_BY_CATEGORY,
    {
      variables: { name: category}
    }
  );
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  return (
    <div className="my-24">
      <div className="mb-16 text-3xl font-bold">{data.category.name}</div>
      <ul className="grid grid-cols-5 grid-rows-1 gap-3">
        {data.category.products.map(p => (
          <li key={p.id} aria-label={p.name}>
            <ProductRow product={p} />
          </li>
        ))}
      </ul>
    </div>
  )
}

export {ListProductList}