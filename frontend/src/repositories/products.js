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
  cost_price,
  sale_price,
  active,
  image,
  category_id,
}) {
  return await apiClient({
    method: "post",
    headers: {
      "Content-Type": "multipart/form-data",
    },
    url: `/products`,
    data: {
      product: {
        name,
        description,
        cost_price,
        sale_price,
        active,
        image,
        category_id,
      },
    },
  });
}
