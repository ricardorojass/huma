import React from 'react';
import { Field, Formik } from 'formik';
import { PropTypes } from 'prop-types';

export default function LoginForm({ onSubmit }) {
  return (
    <Formik
      initialValues={{
        email: 'user@example.com',
        password: '12345678',
      }}
      onSubmit={onSubmit}
    >
      {({ handleSubmit, isSubmitting, errors }) => (
        <form onSubmit={handleSubmit}>
          <fieldset disabled={isSubmitting}>
            <fieldset className="form-control">
              <label htmlFor="email" className="label">
                <span className="label-text-alt">Email</span>
              </label>
              <Field
                name="email"
                component="input"
                type="email"
                placeholder="Email"
                className="input input-bordered input-md"
                required
              />
            </fieldset>
            <fieldset className="form-control">
              <label htmlFor="password" className="label">
                <span className="label-text-alt">
                  Contrase&#241;a
                </span>
              </label>
              <Field
                name="password"
                component="input"
                type="password"
                placeholder="Contrase&#241;a"
                className="input input-bordered input-md"
                required
              />
            </fieldset>
            <button
              type="submit"
              className="w-full mt-4 text-base font-medium capitalize text-base-100 btn btn-primary"
            >
              Continuar
            </button>
          </fieldset>
        </form>
      )}
    </Formik>
  );
}

LoginForm.propTypes = {
  onSubmit: PropTypes.func.isRequired,
};
