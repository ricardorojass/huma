/** @jsx jsx */
import {jsx} from '@emotion/react';
import { ProductRow } from './product-row';
import { useQuery, gql } from '@apollo/client';

const GET_ALL_PRODUCTS = gql`
  query {
    products {
      id
      name
      description
      costPrice
      salePrice
      active
      thumbnail
    }
  }
`

function AdminProductList() {
  const { loading, error, data } = useQuery(GET_ALL_PRODUCTS);
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  return (
    <div>
      <div className="pb-5 text-3xl font-bold">Product list</div>
      <div className="flex flex-col">
        <div className="overflow-x-auto">
          <table className="table w-full">
            {/* <!-- head --> */}
            <thead>
              <tr>
                <th>ID</th>
                <th>Thumbnail</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Categoria</th>
                <th>Precio costo</th>
                <th>Precio de venta</th>
              </tr>
            </thead>
            <tbody>
              {/* <!-- row 1 --> */}
              {data.products.map(p => (
                <tr key={p.id} aria-label={p.name} className="hover">
                  <th>{p.id}</th>
                  <td>image</td>
                  <th>{p.name}</th>
                  <td>{p.description}</td>
                  <td>{p.category}</td>
                  <td>{p.costPrice}</td>
                  <td>{p.salePrice}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

export {AdminProductList}