/** @jsx jsx */
import {jsx} from '@emotion/react';
import { useState } from 'react';
import { useNavigate } from "react-router-dom";
import { gql, useMutation } from '@apollo/client';
import useForm from '../components/useForm';
import { AdminProductList } from '../components/admin-product-list';

const CREATE_PRODUCT = gql`
  mutation CreateProduct(
    $name: String!
    $description: String!
    $category: String!
    $costPrice: Float!
    $salePrice: Float!
    $image: Upload
  ) {
    createProduct(
      input: {
        name: $name
        description: $description
        category: $category
        costPrice: $costPrice
        salePrice: $salePrice
        image: $image
      }
    ) {
        product {
          id
          name
          costPrice
          salePrice
          thumbnail
        }
        errors
    }
  }
`

export default () => {
  const navigate = useNavigate();

  const { inputs, handleChange, clearForm } = useForm({
    image: '',
    category: 'Bienestar',
    name: 'Bruma',
    description: 'description test',
    costPrice: 15000,
    salePrice: 24000
  });

  const [createProduct, { loading, error, data }] = useMutation(
    CREATE_PRODUCT,
    {
      variables: inputs,
    }
  );

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const { data } = await createProduct();
      console.log('res: ' + data.createProduct.product.id)
      clearForm();
      navigate(`/admin/products/${data.createProduct.product.id}`);

    } catch(error) {
      console.log(error);
    }
  }

  if (error) return <p>Error : {error.message}</p>;
  return (
    <div className="h-screen mt-24 bg-base-200 lg:p-6">
      <form className="w-1/2 mx-auto form-control"
        onSubmit={handleSubmit}
      >
        <label htmlFor="image" className="label">
          <span className="label-text">Image</span>
          <span className="label-text-alt">Image</span>
        </label>
        <input
          type="file"
          id="image"
          name="image"
          className="w-full file-input"
          onChange={handleChange}
          />

        <label htmlFor="category" className="label">
          <span className="label-text">Categoria</span>
          <span className="label-text-alt">Categoria</span>
        </label>
        <select
          id="category"
          name="category"
          value={inputs.category}
          onChange={handleChange}
          className="select select-bordered">
          <option disabled defaultValue>Selecciona una categoria de producto</option>
          <option>Facial</option>
          <option>Bienestar</option>
        </select>

        <label htmlFor="name" className="label">
          <span className="label-text">Name</span>
          <span className="label-text-alt">Name</span>
        </label>
        <input
          disabled={loading}
          type="text"
          id="name"
          name="name"
          placeholder="Ingresa el nombre del producto"
          className="w-full input input-bordered"
          value={inputs.name}
          onChange={handleChange}
        />

        <label htmlFor="description" className="label">
          <span className="label-text">Descripcion</span>
          <span className="label-text-alt">descripcion</span>
        </label>
        <input
          type="text"
          id="description"
          name="description"
          placeholder="Ingresa la descripcion del producto"
          className="w-full input input-bordered"
          value={inputs.description}
          onChange={handleChange}
        />

        <label htmlFor="costPrice" className="label">
          <span className="label-text">Precio de costo</span>
          <span className="label-text-alt">Precio de costo</span>
        </label>
        <input
          type="number"
          id="costPrice"
          name="costPrice"
          placeholder="Ingresa el costo del producto"
          className="w-full input input-bordered"
          value={inputs.costPrice}
          onChange={handleChange}
        />

        <label htmlFor="salePrice" className="label">
          <span className="label-text">Precio de venta</span>
          <span className="label-text-alt">Precio de venta</span>
        </label>
        <input
          type="number"
          id="salePrice"
          name="salePrice"
          placeholder="Ingresa el precio de venta del producto"
          className="w-full input input-bordered"
          value={inputs.salePrice}
          onChange={handleChange}
        />
        <button type="submit" className="max-w-xs mt-4 font-bold text-base-100 bg-primary btn btn-primary">+ Crear Producto</button>
      </form>

      <AdminProductList />
    </div>
  )

}