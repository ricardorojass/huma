/** @jsx jsx */
import {jsx} from '@emotion/react';
import { useEffect } from 'react';

function AdminLastProduct({product}) {
  const { id, name, description, category, costPrice, salePrice, thumbnail } = product;
  // TODO: include empty UI state

  return (
    <div>
      <p className="pt-20 text-2xl font-bold">Producto creado</p>
      <div className="flex flex-col">
        <div className="overflow-x-auto">
          <table className="table w-full">
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
              <tr key={id} aria-label={name}>
                <th>{id}</th>
                <td>
                  <div className="avatar">
                    <div className="w-12 h-12 mask mask-squircle">
                      <img src={thumbnail} alt={name} />}
                    </div>
                  </div>
                </td>
                <th>{name}</th>
                <td>{description}</td>
                <td>{category ? category.name : ''}</td>
                <td>{costPrice}</td>
                <td>{salePrice}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

export {AdminLastProduct}