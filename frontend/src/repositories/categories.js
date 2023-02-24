import apiClient from "@repositories/apiClient";

export const getCategories = async ({ query }) => {
  return await apiClient({
    method: "get",
    url: `/categories${query}`,
  });
};

export async function getCategory({ query }) {
  return await apiClient({
    method: "get",
    url: `/categories/${query}`,
  });
}

export async function createCategory({ name, description }) {
  return await apiClient({
    method: "post",
    url: `/categories`,
    data: {
      product: {
        name,
        description,
      },
    },
  });
}
