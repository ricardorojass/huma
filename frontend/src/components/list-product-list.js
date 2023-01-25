/** @jsx jsx */
import {jsx} from '@emotion/react';
import { ProductRow } from './product-row';
import { useQuery } from '@apollo/client';
import Slider from "react-slick";
import { GET_PRODUCTS_BY_CATEGORY } from '../queries';

function ListProductList({category}) {
  const { loading, error, data } = useQuery(
    GET_PRODUCTS_BY_CATEGORY,
    {
      variables: { name: category}
    }
  );
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error : {error.message}</p>;

  const settings = {
    dots: false,
    infinite: true,
    speed: 500,
    slidesToShow: 5,
    slidesToScroll: 2
  };

  return (
    <div className="my-24">
      <div className="mb-16 text-3xl font-bold">{data.category.name}</div>
        <ul className="">
          <Slider {...settings}>
            {data.category.products.map(p => (
                <li key={p.id} aria-label={p.name}>
                    <ProductRow product={p} />
                </li>
            ))}
          </Slider>
        </ul>

    </div>
  )
}

export {ListProductList}