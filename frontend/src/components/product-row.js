/** @jsx jsx */
import {jsx} from '@emotion/react'

function ProductRow({product}) {
  const { name, description, value, size } = product

  return (
    <div className="flex flex-col overflow-hidden shadow-xl h-96 w-fit card-compact bg-base-100 rounded-xl">
      <figure><img src="https://placeimg.com/400/225/arch" alt="name" /></figure>
      <div className="card-body">
        <h2 className="text-lg font-bold card-title">{name}</h2>
        <p className="text-base text-neutral">{description}</p>
        <p>${value} pesos</p>
        <div className="justify-center card-actions">
          <button className="w-full text-base font-bold text-base-100 bg-primary btn bnt-primay">Añadir a la cesta</button>
        </div>
      </div>
    </div>
  )
}

export {ProductRow}