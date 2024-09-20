import React, { useContext, useEffect, useState } from "react";
import APIs, { authAPIs, endpoints } from "../configs/APIs";
import MyUserReducer from "../reducers/MyUserReducer";

const CategoryManager = () => {
  const user = useContext(MyUserReducer);
  const [cate, setCate] = useState([]);

  const loadCate = async () => {
    try {
      let res = await APIs.get(endpoints["getAllCategories"]);
      setCate(res.data);
    } catch (error) {
      console.log(error);
    }
  };
  useEffect(() => {
    loadCate();
  }, []);

  const handleDeleteCategory = async (cateId) => {
    try {
      let res = await APIs.delete(endpoints['deleteCategory'](cateId))
      if(res.status === 204) {
        alert("Xóa thành công")
      }
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen">
      <div className="w-4/5 lg:w-3/4 xl:w-2/3 mx-auto bg-white p-6 rounded-lg shadow-lg">
        <table className="min-w-full bg-white border border-gray-200 shadow-md">
          <thead>
            <tr>
              <th className="py-3 px-6 bg-gray-100 border-b text-left">ID</th>
              <th className="py-3 px-6 bg-gray-100 border-b text-left">Name</th>
              <th className="py-3 px-6 bg-gray-100 border-b text-left">
                Actions
              </th>
            </tr>
          </thead>
          <tbody>
            {cate.map((category) => (
              <tr key={category.id}>
                <td className="py-3 px-6 border-b">{category.id}</td>
                <td className="py-3 px-6 border-b">{category.name}</td>
                <td className="py-3 px-6 border-b">
                  <button className="text-blue-500 hover:text-blue-700 mr-4">
                    Edit
                  </button>
                  <button
                    className="text-red-500 hover:text-red-700"
                    onClick={() => handleDeleteCategory(category.id)}
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default CategoryManager;
