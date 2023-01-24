/** @jsx jsx */
import {jsx} from '@emotion/react';
import { useQuery } from '@apollo/client';
import { GET_PRODUCTS } from '../queries';

// TODO: show images from server
export default () => {
  const { loading, error, data } = useQuery(GET_PRODUCTS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  return (
    <div className="h-screen pt-24 mt-24 bg-base-200 lg:p-6">
      <h1>Products</h1>
      <div className="flex flex-col">
        <div className="overflow-x-auto">
          <table className="table w-full table-compact table-zebra">
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
              {data.products.map((p) =>
                <tr key={p.id} aria-label={p.name}>
                  <th>{p.id}</th>
                  <td>
                    <div className="avatar">
                      <div className="w-12 h-12 mask mask-squircle">
                        <img src={p.thumbnail} alt={name} />}
                      </div>
                    </div>
                  </td>
                  <th>{p.name}</th>
                  <td>{p.description}</td>
                  <td>{p.category ? p.category.name : ''}</td>
                  <td>{p.costPrice}</td>
                  <td>{p.salePrice}</td>
                </tr>

              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}