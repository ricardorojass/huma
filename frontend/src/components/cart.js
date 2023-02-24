/** @jsx jsx */
import { css, jsx } from "@emotion/react";
import CartStyles from "./styles/CartStyles";
import calcTotalPrice from "../lib/calcTotalPrice";
import { useCart } from "../contexts/cartState";
import { GET_CART_ITEMS } from "../queries";

function CartItem({ cartItem }) {
  const { product } = cartItem;
  if (!product) return null;
  return (
    <li className="grid grid-cols-3 gap-4 p-4 border-b-2 border-gray-400">
      <img className="mr-4" src={product.thumbnail} alt={product.name} />
      <div>
        <h3>{product.name}</h3>
        <p>${product.salePrice * cartItem.quantity}</p>
        <p>{cartItem.quantity}</p>
      </div>
    </li>
  );
}

export default function Cart() {
  // const { loading, error, data } = useQuery(GET_CART_ITEMS);
  const data = [];
  const { cartOpen, closeCart, toggleCart } = useCart();

  if (!data.length) return <p>no data</p>;

  return (
    <CartStyles open={cartOpen}>
      <button
        onClick={toggleCart}
        className="absolute w-8 p-2 bg-white border shadow-2xl -left-10 bottom-16"
      >
        &lt;
      </button>
      <header className="flex flex-col items-center pb-8 mt-2 mb-8 border-b-4 border-neutral">
        {/* <h3 className="px-1 py-1 m-0 text-xl text-white bg-accent">{me.name}`s Cart</h3> */}
        <small className="text-sm font-medium">Sub Total</small>
        <p className="text-base font-bold text-red-800">
          ${calcTotalPrice(data.cartItems)}
        </p>
      </header>
      <ul>
        {data.cartItems.map((cartItem) => (
          <CartItem key={cartItem.id} cartItem={cartItem} />
        ))}
      </ul>
      {/* <footer className="pt-8 mt-8 border-t-4 border-double border-neutral">

    </footer> */}
    </CartStyles>
  );
}
