<<<<<<< HEAD
import React, { useContext, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { MyDispatchContext, MyUserContext } from '../App'
import { Navigate, useNavigate } from "react-router";
import APIs, { endpoints } from '../configs/APIs';

const Header = () => {
  const user = useContext(MyUserContext);
  const dispatch = useContext(MyDispatchContext);
  const nav = useNavigate();

  const [category, setCategories] = useState([])

  const loadCategory = async () => {
    try {
      let res = await APIs.get(endpoints['getAllCategories'])
      setCategories(res.data)
    } catch (error) {
      console.error(error)
    }
  }
  useEffect(() => {
    loadCategory()
  }, [])

  const handleLogout = () => {
    dispatch({ "type": "logout" })
    nav('/')
  }

  return (
    <div className='w-full h-12 bg-blue-700 fixed top-0 left-0 flex items-center justify-between px-4 z-50'>
      <div className='flex items-center justify-between'>
        <Link className='font-bold text-white' to="/">SALE WEBSITE</Link>
        {/* Phần liên kết danh mục */}
        <div className='flex space-x-4 ml-4'>
          {category !== null && category.map(c => (
            <Link key={c.id} className='text-white' to="/">{c.name}</Link>
          ))}
        </div>
      </div>

      {/* Phần đăng nhập/đăng ký hoặc tên người dùng */}
      <div className='space-x-4'>
        {user === null ?
          <>
            <Link className='text-white' to="/Login">Đăng nhập</Link>
            <Link className='text-white' to="/Register">Đăng ký</Link>
          </>
          : <>
            <Link className='text-white' to="/UserDetails">Hi {user.fullName}!</Link>
            <button className='text-white' onClick={handleLogout}>Đăng xuất</button>
          </>}
      </div>
    </div>

  )
=======
import React, { useContext } from 'react'
import { Link } from 'react-router-dom'
import { MyDispatchContext, MyUserContext } from '../App'
import { Navigate, useNavigate } from "react-router";

const Header = () => {
    const user = useContext(MyUserContext);
    const dispatch = useContext(MyDispatchContext);
    const nav = useNavigate();

    const handleLogout = () => {
        dispatch({ "type": "logout" })
        nav('/')
    }

    return (
        <div className='w-full h-12 bg-blue-700 fixed top-0 left-0 flex items-center justify-between px-4 z-50'>
            <Link className='font-bold text-white' to="/">SALE WEBSITE</Link>
            <div className='space-x-4'>
                {user === null ?
                    <>
                        <Link className='text-white' to="/Login">Đăng nhập</Link>
                        <Link className='text-white' to="/Register">Đăng ký</Link></>
                    : <>
                        <Link className='text-white' to="/UserDetails">Hi {user.fullName} !</Link>
                        <button className='text-white' onClick={handleLogout}>Đăng xuất</button>
                    </>}
            </div>
        </div>
    )
>>>>>>> origin/hiep
}

export default Header