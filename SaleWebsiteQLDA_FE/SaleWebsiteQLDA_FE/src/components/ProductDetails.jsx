import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import APIs, { endpoints } from '../configs/APIs';

const ProductDetails = () => {
  const { productId } = useParams(); // Lấy productId từ URL
  const [product, setProduct] = useState(null); // Đặt giá trị mặc định là null để tránh lỗi khi render
  const [loading, setLoading] = useState(true); // Biến để hiển thị loading trong khi đợi dữ liệu

  const loadProduct = async () => {
    try {
      let res = await APIs.get(endpoints['getProductDetail'](productId));
      setProduct(res.data);
      console.log(res.data)
      setLoading(false); // Khi dữ liệu đã tải xong, tắt trạng thái loading
    } catch (error) {
      console.error(error);
      setLoading(false); // Tắt loading nếu có lỗi
    }
  };

  useEffect(() => {
    if (productId) {
      loadProduct();
    }
    // Lắng nghe thay đổi của productId
  }, [productId]);

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <div className="mt-24 h-screen max-w-4xl mx-auto p-6 bg-white shadow-lg rounded-lg">
    {product ? (
      <div className="flex flex-col md:flex-row gap-8">
        {/* Phần hình ảnh sản phẩm */}
        <div className="flex-shrink-0">
          <img 
            src={product.brandId.logo} 
            alt={product.name} 
            className="w-full h-auto object-cover rounded-md" 
          />
        </div>
  
        {/* Phần thông tin sản phẩm */}
        <div className="flex-1">
          {/* Tên sản phẩm */}
          <h1 className="text-4xl font-bold mb-4">{product.name}</h1>
  
          {/* Mô tả sản phẩm */}
          <p className="text-gray-600 text-lg mb-4">{product.description}</p>
  
          {/* Giá sản phẩm */}
          <p className="text-2xl font-semibold text-blue-600 mb-6">
            {product.price} VNĐ
          </p>
  
          {/* Thông tin thương hiệu */}
          <div className="mb-4">
            <h2 className="text-xl font-bold">Brand: {product.brandId.name}</h2>
          </div>
  
          {/* Thông tin danh mục */}
          <div>
            <h2 className="text-xl font-bold">Category: {product.categoryId.name}</h2>
            <p className="text-gray-500">{product.categoryId.description}</p>
          </div>
        </div>
      </div>
    ) : (
      <div className="text-center text-red-500 text-xl">Product not found</div>
    )}
  </div>
  
  );
};

export default ProductDetails;
