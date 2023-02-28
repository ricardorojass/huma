/** @jsx jsx */
import { jsx } from "@emotion/react";
import { useState } from "react";
import useForm from "../components/useForm";
import { useCreateProductMutation } from "@queries/products.query";
import { AdminLastProduct } from "../components/admin-last-product";

export default () => {
  const [product, setProduct] = useState({});
  const { inputs, handleChange, clearForm } = useForm({
    image: "",
    category_id: 1,
    name: "Bruma",
    description: "description test",
    cost_price: 15000,
    sale_price: 24000,
    purchase_price: 30000,
  });

  const createProductMutation = useCreateProductMutation();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      console.log(inputs);
      createProductMutation.mutate(inputs, {
        onSuccess: (res) => {
          console.log("query", res);
        },
      });

      // setProduct(productRes);
      clearForm();
    } catch (error) {
      console.log(error);
    }
  };

  // if (error) return <p>Error : {error.message}</p>;
  return (
    <div className="h-screen mt-24 bg-base-200 lg:p-6">
      <form
        className="w-1/2 mx-auto form-control"
        // disabled={loading}
        onSubmit={handleSubmit}
      >
        <label htmlFor="image" className="label">
          <span className="label-text">Image</span>
          <span className="label-text-alt">Image</span>
        </label>
        <input
          required
          type="file"
          id="image"
          name="image"
          className="w-full file-input"
          onChange={handleChange}
        />

        <label htmlFor="category_id" className="label">
          <span className="label-text">Categoria</span>
          <span className="label-text-alt">Categoria</span>
        </label>
        <select
          id="category_id"
          name="category_id"
          value={inputs.category_id}
          onChange={handleChange}
          className="select select-bordered"
        >
          <option disabled defaultValue>
            Selecciona una categoria de producto
          </option>
          <option>Facial</option>
          <option>Bienestar</option>
        </select>

        <label htmlFor="name" className="label">
          <span className="label-text">Name</span>
          <span className="label-text-alt">Name</span>
        </label>
        <input
          required
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
          required
          type="text"
          id="description"
          name="description"
          placeholder="Ingresa la descripcion del producto"
          className="w-full input input-bordered"
          value={inputs.description}
          onChange={handleChange}
        />

        <label htmlFor="cost_price" className="label">
          <span className="label-text">Precio de costo</span>
          <span className="label-text-alt">Precio de costo</span>
        </label>
        <input
          required
          type="number"
          id="cost_price"
          name="cost_price"
          placeholder="Ingresa el costo del producto"
          className="w-full input input-bordered"
          value={inputs.cost_price}
          onChange={handleChange}
        />

        <label htmlFor="sale_price" className="label">
          <span className="label-text">Precio de venta</span>
          <span className="label-text-alt">Precio de venta</span>
        </label>
        <input
          required
          type="number"
          id="sale_price"
          name="sale_price"
          placeholder="Ingresa el precio de venta del producto"
          className="w-full input input-bordered"
          value={inputs.sale_price}
          onChange={handleChange}
        />
        <button
          type="submit"
          className="max-w-xs mt-4 font-bold text-base-100 bg-primary btn btn-primary"
        >
          + Crear Producto
        </button>
      </form>
      <div className="divider"></div>
      // <AdminLastProduct product={product} />
    </div>
  );
};
