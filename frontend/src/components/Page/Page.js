import PropTypes from 'prop-types';
import React from 'react';
import { Helmet } from 'react-helmet';
import Header from '../Header/Header';

const Page = ({ children, title, className }) => (
  <>
    <Helmet title={`${title} — Huma`} />
    <Header />
    <div className={className}>{children}</div>
  </>
);

Page.propTypes = {
  children: PropTypes.node.isRequired,
  title: PropTypes.string.isRequired,
  className: PropTypes.string.isRequired,
};

export default Page;
