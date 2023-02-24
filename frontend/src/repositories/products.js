import apiClient from "@repositories/apiClient";

export const getProducts = async ({ query }) => {
  return await apiClient({
    method: "get",
    url: `/products${query}`,
  });
};

export async function getProduct({ query }) {
  return await apiClient({
    method: "get",
    url: `/products/${query}`,
  });
}

export async function createProduct({
  name,
  description,
  const_price,
  sale_price,
  purchase_price,
  active,
  thumbnail,
  category_id,
}) {
  return await apiClient({
    method: "post",
    url: `/products`,
    data: {
      product: {
        name,
        description,
        const_price,
        sale_price,
        purchase_price,
        active,
        thumbnail,
        category_id,
      },
    },
  });
}
