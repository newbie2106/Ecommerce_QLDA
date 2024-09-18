import { useEffect, useState } from 'react';
import { useLocation, useParams } from 'react-router-dom';
import APIs, { endpoints } from '../configs/APIs';

const ProductDetails = () => {
    const { productId } = useParams(); // Lấy productId từ URL
    const [product, setProduct] = useState()

    const loadProduct = async () => {
        try {
            let res = await APIs.get(endpoints['getProductDetail'](productId))
            setProduct(res.data)
            console.log(res.data)
        } catch (error) {
            console.error(error)
        }
    }

    useEffect(() => {
        loadProduct();
    },[])

  return (
    <div className='mt-24'>
    
    </div>
  );
};

export default ProductDetails;
