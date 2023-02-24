/** @jsx jsx */
import { jsx } from "@emotion/react";
import Slider from "react-slick";
import { useGetCategoriesQuery } from "@queries/categories.query";
import ProductRow from "./product-row";

export default function ListProductList() {
  const query = "?embed=products";
  const { data } = useGetCategoriesQuery(query);
  const categories = data?.data;

  const settings = {
    dots: false,
    infinite: true,
    speed: 500,
    slidesToShow: 5,
    slidesToScroll: 2,
  };

  return (
    <div>
      {categories?.map((category) => (
        <div key={category.id} className="my-20">
          <div className="mb-16 text-3xl font-bold">{category.name}</div>
          <ul className="">
            <Slider {...settings}>
              {category.products.map((product) => (
                <li key={product.id} aria-label={product.name}>
                  <ProductRow product={product} />
                </li>
              ))}
            </Slider>
          </ul>
        </div>
      ))}
    </div>
  );
}
