import React from 'react'
import { Link } from 'react-router-dom'

const Home = () => {
  return (
    <div>
      <h1 class="text-center">TRANG CHỦ</h1>
      <Link to="/Register">ĐĂNG KÝ</Link>
    </div>
  )
}

export default Home
