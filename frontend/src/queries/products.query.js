import {
  QUERY_PRODUCTS_KEY,
  QUERY_PRODUCT_KEY,
} from "@constants/query.constant";
import { getProducts, getProduct, createProduct } from "@repositories/products";

import { useMutation, useQueries, useQuery } from "@tanstack/react-query";

export const useGetProductsQuery = (query = "") => {
  return useQuery({
    queryKey: [QUERY_PRODUCTS_KEY, query],
    queryFn: () => getProducts({ query }).then((res) => res.data),
    keepPreviousData: true,
  });
};

export const useCreateProductMutation = () => useMutation(createProduct);
