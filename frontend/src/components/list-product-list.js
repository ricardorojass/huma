/** @jsx jsx */
import {jsx} from '@emotion/react';
import { ProductRow } from './product-row';
import { useQuery, gql } from '@apollo/client';

const GET_PRODUCTS_BY_CATEGORY = gql`
  query {
    category(name: "Bienestar") {
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

function ListProductList() {
  const { loading, error, data } = useQuery(GET_PRODUCTS_BY_CATEGORY);
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  return (
    <div>
      <div className="pb-5 text-3xl font-bold">{data.category.name}</div>
      <ul className="grid grid-cols-5 grid-rows-1 gap-6">
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