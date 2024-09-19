import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";

const Home = () => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(false);
  const nav = useNavigate()

  const loadAllProducts = async () => {
    try {
      setLoading(true);
      let res = await APIs.get(endpoints["getAllProducts"]);
      setProducts(res.data);
      console.log(res.data);
      if (res.status === 200) {
        setLoading(false);
      }
    } catch (error) {
      console.error(error);
      console.log("loi");
    }
  };

  useEffect(() => {
    loadAllProducts();
  }, []);

  const toProductDetail = (productId) => {
    nav(`/products/${productId}`);  // Đường dẫn tất cả là chữ thường
  };
  
  return (
    <div className="mt-24 mb-8 w-4/5 mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
      {loading ? (
        <div className="flex items-center justify-center fixed inset-0">
          <div className="w-16 h-16 border-4 border-blue-500 border-t-transparent border-solid rounded-full animate-spin"></div>
        </div>
      ) : (
        <>
          {products.map((product) => (
            <div key={product.id} className="rounded overflow-hidden shadow-lg" onClick={() => toProductDetail(product.id)} >
              <img
                className="w-full"
                src={product.brandId.logo}
                alt="Product Image"
              />
              <div className="px-6 py-4">
                <div className="font-bold text-xl mb-2">{product.name}</div>
                <p className="text-gray-700 text-base">{product.description}</p>
              </div>
              <div className="px-6 pt-4 pb-2">
                <span className="inline-block bg-blue-200 rounded-full px-3 py-1 text-sm font-semibold text-blue-700 mr-2 mb-2">
                  {product.price} VNĐ
                </span>
              </div>
            </div>
          ))}
        </>
      )}
    </div>
  );
};

export default Home;
