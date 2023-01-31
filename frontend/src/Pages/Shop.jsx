import * as React from 'react';
import { useEffect } from "react";
import Loading from '../components/Loading';
import { ListProductList } from '../components/list-product-list';

// TODO: use lowercase in Database
const categories = {
  bienestar: 'Bienestar',
  facial: 'Facial',
}

export default () => {
  const [isLoading, setIsLoading] = React.useState(true);


  useEffect(() => {
    console.log('Home');
    setTimeout(() => {
      setIsLoading(false);

    }, 3000);
  }, [])


  return (
    <div className="h-auto pt-20 bg-base-200">
      <div className="max-w-screen-xl m-auto">
        <div className="bg-white max-h-28 h-28">Banner</div>
        <ListProductList category={categories.bienestar}/>
        <ListProductList category={categories.facial}/>
      </div>
    </div>
  )
}