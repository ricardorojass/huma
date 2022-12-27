import * as React from 'react';
import { useEffect } from "react"
import Loading from '../components/Loading';

export default () => {
  const [isLoading, setIsLoading] = React.useState(true);


  useEffect(() => {
    console.log('Home');
    setTimeout(() => {
      setIsLoading(false);

    }, 3000);
  }, [])


  return (
    <>
      <div>Product List</div>
    </>
  )
}