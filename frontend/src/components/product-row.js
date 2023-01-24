/** @jsx jsx */
import {jsx} from '@emotion/react'
import { Link } from 'react-router-dom'

function ProductRow({product}) {
  const { id, name, description, thumbnail } = product;

  return (
    <div className="flex flex-col overflow-hidden shadow-xl h-96 w-fit card-compact card bg-base-100">
      <figure><img src={thumbnail} alt={`${product.name}`} /></figure>
      <div className="card-body">
        <Link to={`/product/${product.id}`}
          className="leading-tight hover:link">
          <h2 className="text-lg font-bold leading-none">{product.name}</h2>
          <p className="text-base text-neutral">{product.description}</p>

        </Link>
        <p className="pt-12">${product.salePrice} pesos</p>
        <div className="justify-center card-actions">
          <button className="w-full text-base font-bold text-base-100 bg-primary btn bnt-primary">Añadir a la cesta</button>
        </div>
      </div>
    </div>
  )
}

export {ProductRow}