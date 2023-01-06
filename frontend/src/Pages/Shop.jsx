import * as React from 'react';
import { useEffect } from "react"
import Loading from '../components/Loading';
import { ListProductList } from '../components/list-product-list';

export default () => {
  const [isLoading, setIsLoading] = React.useState(true);


  useEffect(() => {
    console.log('Home');
    setTimeout(() => {
      setIsLoading(false);

    }, 3000);
  }, [])


  return (
    <div className="h-screen p-6 mt-24 bg-base-200">
      <ListProductList />
    </div>
  )
}