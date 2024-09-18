import { useSearchParams } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";
import { useEffect, useState } from "react";


const Home = () => {


  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(false);
  const [q,] = useSearchParams();
  const [page, setPage] = useState(1);


  const loadProducts = async () => {
    setLoading(true);
    try {
      let url = `${endpoints['getAllProducts']}?page=${page}`;

      let cateId = q.get('cateId');
      if (cateId) {
        url = `${url}&cateId=${cateId}`
        setPage(1);
      } else {
        let kw = q.get('kw');
        if (kw) {
          url = `${url}&kw=${kw}`;
          setPage(1);
        }
      }

      let res = await APIs.get(url);
      if (page === 1)
        setProducts(res.data);
      else if (page > 1)
        setProducts(current => {
          return [...current, ...res.data];
        });
    } catch (ex) {
      console.error(ex);
    } finally {
      setLoading(false);
    }

  }

  useEffect(() => {
    loadProducts();
  }, [q, page]);

  const loadMore = () => {
    if (!loading)
      setPage(page + 1);
  }

  // const addToCart = (p) => {
  //   let cart = cookie.load("cart") || null;
  //   if (cart === null)
  //       cart = {};

  //   if (p.id in cart) {
  //       // có trong giỏ
  //       cart[p.id]["quantity"]++;
  //   } else {
  //       // chưa có trong giỏ
  //       cart[p.id] = {
  //           "id": p.id,
  //           "name": p.name,
  //           "price": p.price,
  //           "quantity": 1
  //       }
  //   }

  //   cookie.save("cart", cart);
  //   dispatch({
  //       type: 'update-cart',
  //       payload: countCart()
  //   })
  // }

  // const countCart = () => {
  //   let count = 0;
  //   let cart = cookie.load("cart") || null;
  //   if (cart !== null) {
  //       for (let c of Object.values(cart))
  //           count += c.quantity;
  //   }

  //   return count;
  // }

  return (

    <div>
      {products.map(p => <div key={p.id}>{p.name}</div>

    )}
    </div>
  );


}
export default Home;