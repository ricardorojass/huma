import {
  QUERY_CATEGORIES_KEY,
  QUERY_CATEGORY_KEY,
} from "@constants/query.constant";
import {
  getCategories,
  getCategory,
  createCategory,
} from "@repositories/categories";

import { useMutation, useQueries, useQuery } from "@tanstack/react-query";

export const useGetCategoriesQuery = (query = "") => {
  return useQuery({
    queryKey: [QUERY_CATEGORIES_KEY, query],
    queryFn: () => getCategories({ query }).then((res) => res.data),
    keepPreviousData: true,
  });
};

export const useGetCategoryQuery = (query = "") => {
  return useQuery({
    queryKey: [QUERY_CATEGORY_KEY, query],
    queryFn: () => getCategory({ query }).then((res) => res.data),
    keepPreviousData: true,
  });
};

export const usePostCategoryQuery = (query = "") => {
  return useQuery({
    queryKey: [QUERY_CATEGORIES_KEY, query],
    queryFn: () => createCategory({ query }).then((res) => res.data),
    keepPreviousData: true,
  });
};

export const useCreateProductMutation = () => useMutation(createProduct);
