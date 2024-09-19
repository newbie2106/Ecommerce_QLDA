import React, { useContext, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { MyDispatchContext, MyUserContext } from '../App'
import { Navigate, useNavigate } from "react-router";
import APIs, { endpoints } from '../configs/APIs';

const Header = () => {
    const user = useContext(MyUserContext);
    const dispatch = useContext(MyDispatchContext);
    const [cate, setCate] = useState([])

    const nav = useNavigate();

    const handleLogout = () => {
        dispatch({ "type": "logout" })
        nav('/')
    }

    const loadCate = async () => {
      try {
        let res = await APIs.get(endpoints['getAllCategories'])
        setCate(res.data)
      } catch (error) {
        console.log(error)
      }
    }
    useEffect(() => {
      loadCate()
    },[])



    return (
        <div className='w-full h-12 bg-blue-700 fixed top-0 left-0 flex items-center justify-between px-4 z-50'>
            <div>
              <Link className='font-bold text-white' to="/">SALE WEBSITE</Link>
              {cate.map((c) => <Link className='text-white ml-8' to="/">{c.name}</Link> )}
            </div>
            <div className='space-x-4'>
                {user === null ?
                    <>
                        <Link className='text-white' to="/login">Đăng nhập</Link>
                        <Link className='text-white' to="/register">Đăng ký</Link></>
                    : <>
                        <Link className='text-white' to="/userDetails">Hi {user.username} !</Link>
                        <button className='text-white' onClick={handleLogout}>Đăng xuất</button>
                    </>}
            </div>
        </div>
    )
}

export default Header