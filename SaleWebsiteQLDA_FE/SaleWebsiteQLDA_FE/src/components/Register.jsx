import React, { useRef, useState } from "react";
import { Navigate, useNavigate } from "react-router";
import APIs, { endpoints } from "../configs/APIs";

const Register = () => {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [address, setAddress] = useState("");
  const avatar = useRef();
  const nav = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [rePassword, setRePassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleRegister = async (e) => {
    e.preventDefault();
    
    if (password === undefined || password !== rePassword)
      setErr("Mật khẩu KHÔNG khớp!");
    else {
      setLoading(true);
      let form = new FormData();

      if (form !== "confirm") {
        form.append("firstName", firstName);
        form.append("lastName", lastName);
        form.append("email", email);
        form.append("phone", phone);
        form.append("address", address);
        form.append("username", username);
        form.append("password", password);
      }

      form.append("file", avatar.current.files[0]);

      let res = await APIs.post(endpoints["registerUser"], form, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      console.info(res.data);
      if (res.status === 201) {
        setLoading(false);
        nav("/login");
      }
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100 mt-4">
      {loading ? (
        <>
          <div class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50">
            <div class="animate-spin rounded-full h-16 w-16 border-t-4 border-b-4 border-white"></div>
          </div>
        </>
      ) : (
        <>
          <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
            <h1 className="text-2xl font-bold mb-6 text-center">
              Đăng Ký Tài Khoản
            </h1>
            <form onSubmit={handleRegister}>
              <div className="mt-3">
                <label
                  for="firstName"
                  class="block text-sm font-medium text-gray-700"
                >
                  Tên
                </label>
                <input
                  type="text"
                  id="firstName"
                  name="firstName"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={firstName}
                  onChange={(e) => setFirstName(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="lastName"
                  class="block text-sm font-medium text-gray-700"
                >
                  Họ và tên đệm
                </label>
                <input
                  type="text"
                  id="lastName"
                  name="lastName"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={lastName}
                  onChange={(e) => setLastName(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="email"
                  class="block text-sm font-medium text-gray-700"
                >
                  Email
                </label>
                <input
                  type="email"
                  id="email"
                  name="email"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="phone"
                  class="block text-sm font-medium text-gray-700"
                >
                  Số điện thoại
                </label>
                <input
                  type="number"
                  id="phone"
                  name="phone"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={phone}
                  onChange={(e) => setPhone(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="address"
                  class="block text-sm font-medium text-gray-700"
                >
                  Địa chỉ
                </label>
                <input
                  type="text"
                  id="address"
                  name="address"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={address}
                  onChange={(e) => setAddress(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="username"
                  class="block text-sm font-medium text-gray-700"
                >
                  Tên đăng nhập
                </label>
                <input
                  type="text"
                  id="username"
                  name="username"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="password"
                  class="block text-sm font-medium text-gray-700"
                >
                  Mật khẩu
                </label>
                <input
                  type="password"
                  id="password"
                  name="password"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>
              <div className="mt-3">
                <label
                  for="password"
                  class="block text-sm font-medium text-gray-700"
                >
                  Nhập lại mật khẩu
                </label>
                <input
                  type="password"
                  id="rePassword"
                  name="rePpassword"
                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  value={rePassword}
                  onChange={(e) => setRePassword(e.target.value)}
                  required
                />
              </div>

              <div className="mt-3">
                <label
                  for="file"
                  class="block text-sm font-medium text-gray-700"
                >
                  Chọn ảnh đại diện
                </label>
                <input
                  type="file"
                  id="file"
                  name="file"
                  class="mt-1 block w-full px-3 py-2  border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                  ref={avatar}
                  accept=".png, .jpg, .webp"
                  required
                />
              </div>
              <div className="mt-4">
                <button
                  type="submit"
                  className="block w-full px-3 py-2 border rounded-2xl bg-blue-700 text-white"
                >
                  Đăng ký
                </button>
              </div>
            </form>
          </div>
        </>
      )}
    </div>
  );
};

export default Register;
