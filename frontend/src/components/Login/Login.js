import React from "react";
import _ from "lodash";
import Page from "../Page/Page";
import { Link, useNavigate } from "react-router-dom";
import LoginForm from "./Form";
import tokenStorage from "@lib/tokenStorage";

export default function Login() {
  const navigate = useNavigate();

  return (
    <Page title="Ingresar" className="h-auto pb-6 pt-28 bg-base-200">
      <div className="max-w-screen-xl m-auto">
        <div className="flex justify-center">
          <div className="p-14 bg-white rounded card w-[calc(100vw-80%)] min-w-[430px] max-w-[430px] shadow-sm">
            <h1 className="mb-3 text-2xl">
              ¡Hola!, Para agregar al carrito, ingresa tu e-mail
            </h1>
            <LoginForm
              onSubmit={async (values, { setSubmitting, setErrors }) => {
                console.log(values);

                setSubmitting(false);

                // tokenStorage.write(mutationData.signInUser.token);
                navigate(-1);
              }}
            />
            <p className="mt-6 font-medium text-center text-blue-400 text-md">
              <Link to="/">Crear cuenta</Link>
            </p>
          </div>
        </div>
      </div>
    </Page>
  );
}
