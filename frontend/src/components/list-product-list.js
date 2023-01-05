/** @jsx jsx */
import {jsx} from '@emotion/react'
import { ProductRow } from './product-row'

const products = [
  {
    id: 1,
    name: 'Bruma',
    description: 'Ideal para el sueño',
    value: '26',
    size: '120ml'
  },
  {
    id: 2,
    name: 'Shampoo de Cebolla',
    description: 'Ideal para evitar la caida del cabello',
    value: '28',
    size: '150ml'
  },
  {
    id: 3,
    name: 'Vela de Soya',
    description: 'Ultrahidratante natural',
    value: '29',
    size: '100gr'
  },
  {
    id: 4,
    name: 'Aceite Terapeutico',
    description: 'Reduce el dolor y activa la circulacion',
    value: '32',
    size: '20ml'
  },
  {
    id: 5,
    name: 'Roll-On Mentolado',
    description: 'Disminuye congestion nasal y la migraña',
    value: '23',
    size: '7gr'
  },
]

function ListProductList() {

  if (!products.length) {
    return <div css={{marginTop: '1em', fontSize: '1.2em'}}>No Products</div>
  }


  return (
    <div>
      <div className="pb-5 text-3xl font-bold">Bienestar</div>
      <ul className="grid grid-cols-5 grid-rows-1 gap-6">
        {products.map(p => (
          <li key={p.id} aria-label={p.name}>
            <ProductRow product={p} />
          </li>
        ))}
      </ul>
    </div>
  )
}

export {ListProductList}