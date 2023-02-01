import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import Page from '../Page';
import Loading from '@components/Loading';
import ListProductList from '@components/list-product-list';

// TODO: use lowercase in Database
const categories = {
  bienestar: 'Bienestar',
  facial: 'Facial',
};

function Home() {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    console.log('Home');
    setTimeout(() => {
      setIsLoading(false);
    }, 7000);
  }, []);

  return (
    <Page title="Tienda" className="h-auto pt-20 bg-base-200">
      <div className="max-w-screen-xl m-auto">
        <div className="bg-white max-h-28 h-28">Banner</div>
        <ListProductList category={categories.bienestar} />
        <ListProductList category={categories.facial} />
      </div>
    </Page>
  );
}

export default Home;
