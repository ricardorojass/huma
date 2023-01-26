export default function calcTotalPrice(cart) {
  return cart.reduce((acc, cartItem) => {
    return acc + cartItem.quantity * cartItem.product.salePrice;
  }, 0)
}