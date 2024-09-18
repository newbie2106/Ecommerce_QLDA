import axios from "axios";
import cookie from "react-cookies";

const BASE_URL = "http://localhost:8080/SaleWebsiteQLDA/api";

export const endpoints = {
  registerUser: "/register/",
  loginUser: "/login/",
  "current-user": "/current-user/",

  getAllCategories: "/categories/",

  getAllProducts: "/products/",
  getProductDetail: (productId) => `/products/${productId}/`,
};

// export const authAPIs = () => {
//     const token = cookie.load('token');
//     return axios.create({
//         baseURL: BASE_URL,
//         headers: {
//             'Authorization': `Bearer ${token}`
//         }
//     });
// }
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
