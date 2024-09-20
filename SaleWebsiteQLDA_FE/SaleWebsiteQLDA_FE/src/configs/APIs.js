import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = "http://localhost:8080/SaleWebsiteQLDA/api";

export const endpoints = {
  "current-user": "/current-user/",
  "registerUser": "/register/",
  "getAllProducts": "/products/",
  "loginUser": "/login/",

  "getAllCategories": "/categories/",
  "deleteCategory": (categoryId) => `/categories/${categoryId}/`,

  "getProductDetail": (productId) => `/products/${productId}/`,
};

export const authAPIs = () => {
  return axios.create({
    baseURL: BASE_URL,
    headers: {
      Authorization: cookie.load("token"),
    },
  });
};

export const getCurrentUser = async () => {
  try {
    const res = await axios.get(`${BASE_URL}/current-user/`, {
      headers: {
        Authorization: cookie.load("token"),
      },
    });
    if (res.status === 200) return res;
  } catch (ex) {
    console.error(ex);
  }
};
export default axios.create({
  baseURL: BASE_URL,
});
