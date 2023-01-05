/** @jsx jsx */
import {jsx} from '@emotion/react'

function ProductRow({product}) {
  const { name, description, value, size } = product

  return (
    <div className="shadow-xl h-96 w-fit card card-compact bg-base-100 rounded-xl">
      <figure><img src="https://placeimg.com/400/225/arch" alt="name" /></figure>
      <div className="card-body">
        <h2 className="card-title">{name}</h2>
        <p>{description}</p>
        <p>${value} pesos</p>
        <div className="justify-end card-actions">
          <button className="btn bnt-primay">Comprar</button>
        </div>
      </div>
    </div>
  )
}

export {ProductRow}