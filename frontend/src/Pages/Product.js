/** @jsx jsx */
import {jsx} from '@emotion/react';
import { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useMutation, useQuery, useLazyQuery } from '@apollo/client';
import { useCart } from '../contexts/cartState';
import { GET_PRODUCT, CREATE_CART_ITEM, GET_CART_ITEMS } from '../queries';

export default () => {
  let { productId } = useParams();
  const { openCart } = useCart();
  const loadProduct = useQuery(GET_PRODUCT, { variables: { productId } });
  const { loading: productLoading, error: productError, data: productData } = loadProduct;

  useEffect(() => {
    openCart();
  })

  const [createCartItem, {
    loading: cartItemLoading,
    error: cartItemError,
    data: cartItemData
  }] = useMutation(
    CREATE_CART_ITEM,
    {
      variables: {productId: productId, userId: null},
      refetchQueries: [{ query: GET_CART_ITEMS}]
    }
  );

  const addToCart = async () => {
    try {
      await createCartItem();
    } catch (error) {
      console.log(error);
    }
  }

  if (productLoading) return <p>Loading...</p>;
  if (productError) return <p>Error : {error.message}</p>;

  const { product } = productData;
  console.log('product page', product)
  return (
    <div className="bg-base-200">
      <div className="flex flex-wrap max-w-screen-xl mx-auto mt-16">
        <div className="w-full md:w-1/2">
          <div className="py-4 max-w-[100vw] md:pr-8 md:py-4">
            <div className="overflow-hidden">
              <div className="box-content flex h-full">
                <figure><img className="block w-full rounded-2xl" src={product.thumbnail} alt={`${product.name}`} /></figure>
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
                  <button
                    className="ml-4 text-base font-bold rounded-md hover:bg-primary hover:shadow-md text-base-100 bg-primary btn"
                    onClick={addToCart}>Añadir al carrito</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
