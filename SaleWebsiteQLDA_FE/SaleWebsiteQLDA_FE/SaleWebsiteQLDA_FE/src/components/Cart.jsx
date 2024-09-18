import { useState } from "react";
import { Alert, Button, Table } from "react-bootstrap";
import cookie from "react-cookies";

const Cart = () => {
    const [cart, setCart] = useState(cookie.load("cart") || null);

    if (cart === null) {
        return (
            <Alert variant="warning" className="bg-yellow-100 text-yellow-700 border border-yellow-400 rounded-md p-4">
                KHÔNG có sản phẩm trong giỏ!
            </Alert>
        );
    }

    return (
        <div className="container mx-auto mt-4">
            <h1 className="text-center text-blue-500 font-bold text-2xl mb-4">GIỎ HÀNG</h1>
            <Table striped bordered hover className="table-auto">
                <thead>
                    <tr>
                        <th className="px-4 py-2 text-left">Id</th>
                        <th className="px-4 py-2 text-left">Tên sản phẩm</th>
                        <th className="px-4 py-2 text-left">Gía</th>
                        <th className="px-4 py-2 text-left">Số lượng</th>
                        <th className="px-4 py-2 text-left"></th>
                    </tr>
                </thead>
                <tbody>
                    {Object.values(cart).map((c) => (
                        <tr key={c.id} className="hover:bg-gray-100">
                            <td className="px-4 py-2 text-left">{c.id}</td>
                            <td className="px-4 py-2 text-left">{c.name}</td>
                            <td className="px-4 py-2 text-left">{c.price} VNĐ</td>
                            <td className="px-4 py-2 text-left">{c.quantity}</td>
                            <td className="px-4 py-2 text-left">
                                <Button variant="danger" className="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                                    &times;
                                </Button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </Table>
        </div>
    );
};

export default Cart;