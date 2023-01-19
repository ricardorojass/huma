/** @jsx jsx */
import {jsx} from '@emotion/react';
import { useParams } from 'react-router-dom';
import { useQuery } from '@apollo/client';
import { GET_PRODUCT } from '../queries';

export default () => {
  let { productId } = useParams();
  const { loading, error, data } = useQuery(GET_PRODUCT, {
    variables: { productId },
  });

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  const { product } = data;

  return (
    <div className="mx-auto mt-24 lg:p-6 bg-base-200">
      <div className="flex flex-wrap w-full">
        <div className="w-full md:w-1/2">
          <div className="py-4 max-w-[100vw] md:pr-8 md:py-4">
            <div className="overflow-hidden">
              <div className="box-content flex h-full">
                <figure><img className="block w-full rounded-2xl" src="https://placeimg.com/800/600/nature" alt={`${product.name}`} /></figure>
              </div>
            </div>
          </div>
          <div className="flex-col py-8 pr-8 md:flex">
            <section>
              <header>
                <h3 className="text-3xl font-bold lg:text-4xl">Acerca de este producto</h3>
                <div className="py-8">
                  <p>{product.description}</p>
                </div>
              </header>
            </section>
            <section>
              <h3 className="mb-4 text-xl font-bold">Detalle del Producto</h3>
              <div className="flex flex-col gap-y-2">
                <div className="border collapse collapse-arrow bg-base-100 rounded-box">
                  <input type="checkbox" />
                  <div className="text-lg font-medium collapse-title">
                    Click me to show/hide content
                  </div>
                  <div className="collapse-content">
                    <p>hello</p>
                  </div>
                </div>
                <div className="border collapse collapse-arrow bg-base-100 rounded-box">
                  <input type="checkbox" />
                  <div className="text-lg font-medium collapse-title">
                    Click me to show/hide content
                  </div>
                  <div className="collapse-content">
                    <p>hello</p>
                  </div>
                </div>
              </div>
            </section>
          </div>
        </div>
        <div className="w-full h-auto pb-8 md:w-1/2">
          <div className="top-0 pb-24 mt-3 md:sticky">
            <div className="flex-col justify-center md:flex">
              <nav className="items-center mb-4 text-sm breadcrumbs">
                <ul>
                  <li className="text-lg">Bienestar</li>
                  <li className="text-lg">Brumas</li>
                </ul>
              </nav>
              <h1 className="text-3xl leading-snug lg:text-5xl">{product.name}</h1>
              <div className="mt-4 uppercase">
                <div className="flex items-center font-medium leading-none">
                  <div className="py-2 text-lg leading-none">
                    <span>Size</span>
                  </div>
                </div>
              </div>
              <div className="text-lg">${product.salePrice}</div>
              <div className="mt-4 md:mt-7">
                <div className="relative flex-col items-center">
                  <select className="max-w-xs select select-bordered" name="count" id={`product-count${1}`}>
                    <option value="1">1</option>
                    <option value="2">2</option>
                  </select>
                  <button className="ml-4 text-base font-bold rounded-md hover:bg-primary hover:shadow-md text-base-100 bg-primary btn ">Añadir a la cesta</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
