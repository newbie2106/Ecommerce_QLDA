import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Register from "./components/Register";
import MyUserReducer from "./reducers/MyUserReducer";
import { createContext, useReducer } from 'react';
import Home from './components/Home';
import Header from './components/Header';

import ProductDetails from './components/ProductDetails';
import Login from './components/Login';
import Footer from './components/Footer';

import Login from './components/Login';


export const MyUserContext = createContext();
export const MyDispatchContext = createContext();

const App = () => {
  const [user, dispatch] = useReducer(MyUserReducer, null);
  return (
    <BrowserRouter>
      <MyUserContext.Provider value={user}>
        <MyDispatchContext.Provider value={dispatch}>
          <Header />
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/Register" element={<Register />} />
            <Route path="/Login" element={<Login />} />
            <Route path="/Product/:productId" element={<ProductDetails />} />
          </Routes>
          <Footer/>
        </MyDispatchContext.Provider>
      </MyUserContext.Provider>
    </BrowserRouter>
  );
};

export default App
