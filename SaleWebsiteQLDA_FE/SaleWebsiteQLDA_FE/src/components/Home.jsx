import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";

const Home = () => {
  const [products, setProducts] = useState([]);

  const loadAllProducts = async () => {
    try {
      let res = await APIs.get(endpoints["getAllProducts"]);
      setProducts(res.data);
      console.log(res.data);
    } catch (error) {
      console.error(error);
      console.log("loi");
    }
  };

  useEffect(() => {
    loadAllProducts();
  }, [products]);

  return (
    <div className="mt-24 w-4/5 mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
  {products.map((product) => (
    <div className="rounded overflow-hidden shadow-lg">
      <img
        className="w-full"
        src={product.imageSet[0].url}
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
</div>

  );
};

export default Home;
