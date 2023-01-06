/** @jsx jsx */
import {jsx} from '@emotion/react'

export default ({product}) => {

  return (
    <div className="p-4 mx-auto bg-base-200">
      <div className="flex flex-wrap w-full">
        <div className="w-full md:w-1/2">
          <div className="py-4 max-w-[100vw] md:pr-8 md:py-4">
            <div className="overflow-hidden rounded-2xl">
              <div className="box-content flex h-full">
                <figure><img className="block w-full" src="https://placeimg.com/800/600/nature" alt={`${name}`} /></figure>
              </div>
            </div>
          </div>
          <div className="flex-col py-8 pr-8 md:flex">
            <section>
              <header>
                <h3 className="text-3xl lg:text-4xl">Acerca de este producto</h3>
                <div>
                  <p>Descripcion</p>
                </div>
              </header>
            </section>
          </div>
        </div>
        <div className="w-full h-auto pb-8 md:w-1/2">
          <div className="top-0 pt-8 pb-24 md:sticky">
            <div className="flex-col justify-center md:flex">
              <nav className="items-center mb-4 text-sm breadcrumbs">
                <ul>
                  <li><a className="text-lg" href="">Bienestar</a></li>
                  <li><a className="text-lg" href="">Brumas</a></li>
                </ul>
              </nav>
              <h1 className="text-3xl leading-snug lg:text-5xl">Name</h1>
              <div className="mt-4 uppercase">
                <div className="flex items-center font-medium leading-none">
                  <div className="text-lg leading-none">
                    <span>Size</span>
                  </div>
                </div>
              </div>
              <div className>$Value</div>
              <div className="mt-4 md:mt-7">
                <div className="relative flex-col items-center">
                  <select className="max-w-xs select select-bordered" name="count" id={`product-count${1}`}>
                    <option value="1">1</option>
                    <option value="2">2</option>
                  </select>
                  <button className="ml-4 text-base font-bold rounded-md text-base-100 bg-primary btn bnt-primary">Añadir a la cesta</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
