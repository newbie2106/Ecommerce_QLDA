import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";

const Home = () => {
  const [products, setProducts] = useState([]);
  const nav = useNavigate();

  const [loading, setLoading] = useState(false);

  const loadAllProducts = async () => {
    try {
      setLoading(true);
      let res = await APIs.get(endpoints["getAllProducts"]);
      setProducts(res.data);
      if (res.status === 200) {
        setLoading(false);
      }
      // console.log(res.data);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    loadAllProducts();
  }, []);

  const toProductDetail = (productId) => {
    nav(`/product/${productId}`); // Điều hướng đến đường dẫn chi tiết sản phẩm
  };

  return (
    <div className="mt-24 mb-8 w-11/12 sm:w-4/5 mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 sm:gap-6 lg:gap-8">
      {loading === true ? (
        <div className="absolute inset-0 flex items-center justify-center">
          <div className="w-16 h-16 border-4 border-blue-500 border-dashed rounded-full animate-spin"></div>
        </div>
      ) : (
        <>
          {products.map((product) => (
            <div
              className="rounded-lg overflow-hidden shadow-lg cursor-pointer hover:scale-105 transform transition duration-300 min-h-[400px]"
              key={product.id}
              onClick={() => toProductDetail(product.id)}
            >
              <img
                className="w-4/5l object-cover h-44 sm:h-56 md:h-64 lg:h-72"
                src={product.imageSet[0].url}
                alt="Product Image"
              />
              <div className="px-4 py-3">
                <div className="font-bold text-lg md:text-xl mb-1">
                  {product.name}
                </div>
                <p className="text-gray-700 text-sm md:text-base">
                  {product.description}
                </p>
              </div>
              <div className="px-4 pt-2 pb-3">
                <span className="inline-block bg-blue-200 rounded-full px-3 py-1 text-sm font-semibold text-blue-700">
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
