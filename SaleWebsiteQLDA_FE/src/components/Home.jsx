import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import APIs, { endpoints } from '../configs/APIs'

const Home = () => {
  const [products, setProducts] = useState([])

  const loadAllProducts = async () => {
    try {
      let res = await APIs.get(endpoints['getAllProducts']);
      if(res.status === 200) {
        setProducts(res.data);
        console.log(res.data);
      }
    } catch (error) {
      console.error(error);
    }
  };
  

  useEffect(() => {
    loadAllProducts();
  },[])

  return (
    <div className='mt-12'>
      <h1>TRANG CHỦ</h1>
    </div>
  )
}

export default Home
