import React, { useContext, useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { MyCartContext, MyUserContext } from '../App';
import { authAPIs, endpoints } from '../config/APIs';
import cookie from "react-cookies";

const Payment = () => {
    const navigate = useNavigate();
    const [cart] = useState(cookie.load("cart") || {});
    const [requestId, setRequestId] = useState('');

    const [fullName, setFullName] = useState('');
    const [email, setEmail] = useState('');
    const [phoneNumber, setPhoneNumber] = useState('');
    const [errors, setErrors] = useState({});
    const [loading, setLoading] = useState(false);
    const [waitingMessage, setWaitingMessage] = useState(false);
    const [socket, setSocket] = useState(null);
    const [intervalId, setIntervalId] = useState(null);
    const user = useContext(MyUserContext);
    const [cartCounter, cartDispatch] = useContext(MyCartContext);

    useEffect(() => {
        return () => {
            if (socket) {
                socket.close();
            }
            if (intervalId) {
                clearInterval(intervalId);
            }
        };
    }, [socket, intervalId]);

    const handleConfirmPayment = async () => {
        try {
            const response = await authAPIs().post(endpoints['payment'], {
                paymentChannel: "MOMO",
                payerName: fullName,
                payerEmail: email,
                phone: phoneNumber,
                userId: user.id,
                courses: Object.values(cart).map(item => ({
                    id: item.id,
                    price: item.price
                }))
            });

            if (response.data.payment_url) {
                window.open(response.data.payment_url, '_blank', 'noopener,noreferrer');
                setWaitingMessage(true);
                setRequestId(response.data.requestId);
                startWebSocket(response.data.requestId);
            } else {
                alert('Thanh toán không thành công. Vui lòng thử lại.');
            }
        } catch (error) {
            console.error('Lỗi khi thực hiện thanh toán:', error);
            alert('Đã xảy ra lỗi trong quá trình thanh toán. Vui lòng thử lại.');
        }
    };

    const startWebSocket = (requestId) => {
        // Thay đổi đường dẫn WebSocket ở đây
        const socket = new WebSocket('ws://localhost:8080/SaleWebsiteQLDA/ws'); 
        setSocket(socket);

        const interval = setInterval(() => {
            if (socket.readyState === WebSocket.OPEN) {
                console.log('Gửi: ' + requestId);
                socket.send(requestId);
            }
        }, 3000); 

        setIntervalId(interval);

        const timeout = setTimeout(() => {
            if (socket.readyState === WebSocket.OPEN) {
                console.log('Giao dịch quá hạn.');
                setWaitingMessage(false);
                socket.close();
            }
        }, 30 * 60 * 1000); 

        socket.onopen = () => {
            console.log('WebSocket đã kết nối.');
            if (requestId) {
                console.log('Gửi: ' + requestId);
                socket.send(requestId);
            } else {
                console.error('Request ID không hợp lệ.');
            }
        };

        socket.onmessage = (event) => {
            console.log('Tin nhắn từ máy chủ:', event.data);
            if (event.data === 'Transaction Sucess') {
                clearInterval(interval);
                clearTimeout(timeout);
                cookie.remove('cart');
                cartDispatch({ type: "reset" });
                navigate('/success');
                socket.close();
            }
        };

        socket.onerror = (error) => {
            console.error('Lỗi WebSocket:', error);
            clearInterval(interval);
            clearTimeout(timeout);
            setWaitingMessage(false);
        };

        socket.onclose = (event) => {
            clearInterval(interval);
            clearTimeout(timeout);
            console.log('WebSocket đã đóng.');
            if (event.wasClean) {
                console.log(`Kết thúc sạch sẽ: code=${event.code}, reason=${event.reason}`);
            } else {
                console.error('Kết thúc bất ngờ.');
            }
        };
    };

    const totalAmount = Object.values(cart || {}).reduce((acc, item) => acc + item.price, 0);

    const validateForm = () => {
        const newErrors = {};
        if (!fullName) newErrors.fullName = 'Vui lòng nhập họ tên';
        if (!email) newErrors.email = 'Vui lòng nhập email';
        if (!phoneNumber) newErrors.phoneNumber = 'Vui lòng nhập số điện thoại';
        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = () => {
        if (validateForm()) {
            setLoading(true);
            handleConfirmPayment();
        }
    };

    if (!cart || Object.keys(cart).length === 0) {
        return <div>Không có sản phẩm trong giỏ hàng.</div>;
    }

    return (
        <div className="container mx-auto mt-8 px-4">
            <h1 className="text-center text-3xl font-bold text-blue-500 mb-6">Xác Nhận Thanh Toán</h1>
            <div className="flex flex-wrap -mx-4">
                <div className="w-full md:w-2/3 px-4 mb-6">
                    <div className="bg-white rounded-lg shadow-md p-6">
                        <h2 className="text-xl font-semibold mb-4">Chi Tiết Đơn Hàng</h2>
                        <table className="table-auto w-full">
                            <thead>
                                <tr className="bg-gray-100">
                                    <th className="px-4 py-2">Id</th>
                                    <th className="px-4 py-2">Tên khóa học</th>
                                    <th className="px-4 py-2">Giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                {Object.values(cart).map((item) => (
                                    <tr key={item.id}>
                                        <td className="border px-4 py-2">{item.id}</td>
                                        <td className="border px-4 py-2">{item.title}</td>
                                        <td className="border px-4 py-2">{item.price.toLocaleString("en")} VNĐ</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                        <div className="text-right mt-4">
                            <h4 className="text-lg font-semibold">Tổng cộng: {totalAmount.toLocaleString("en")} VNĐ</h4>
                        </div>
                    </div>
                </div>
                <div className="w-full md:w-1/3 px-4">
                    <div className="bg-white rounded-lg shadow-md p-6">
                        <h2 className="text-xl font-semibold mb-4">Thông Tin Thanh Toán</h2>
                        {waitingMessage ? (
                            <div className="bg-blue-100 border border-blue-400 text-blue-700 px-4 py-3 rounded relative" role="alert">
                                <span className="block sm:inline">Đang chờ xác nhận giao dịch thanh toán...</span>
                            </div>
                        ) : (
                            <form>
                                <div className="mb-4">
                                    <label htmlFor="formFullName" className="block text-gray-700 font-bold mb-2">Họ Tên</label>
                                    <input 
                                        type="text" 
                                        id="formFullName" 
                                        className={`shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline ${!!errors.fullName && 'border-red-500'}`}
                                        placeholder="Nhập họ tên" 
                                        value={fullName} 
                                        onChange={(e) => setFullName(e.target.value)} 
                                    />
                                    {!!errors.fullName && <p className="text-red-500 text-xs italic">{errors.fullName}</p>}
                                </div>

                                <div className="mb-4">
                                    <label htmlFor="formEmail" className="block text-gray-700 font-bold mb-2">Email</label>
                                    <input 
                                        type="email" 
                                        id="formEmail" 
                                        className={`shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline ${!!errors.email && 'border-red-500'}`}
                                        placeholder="Nhập email" 
                                        value={email} 
                                        onChange={(e) => setEmail(e.target.value)} 
                                    />
                                    {!!errors.email && <p className="text-red-500 text-xs italic">{errors.email}</p>}
                                </div>

                                <div className="mb-4">
                                    <label htmlFor="formPhoneNumber" className="block text-gray-700 font-bold mb-2">Số Điện Thoại</label>
                                    <input 
                                        type="tel" 
                                        id="formPhoneNumber" 
                                        className={`shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline ${!!errors.phoneNumber && 'border-red-500'}`}
                                        placeholder="Nhập số điện thoại" 
                                        value={phoneNumber} 
                                        onChange={(e) => setPhoneNumber(e.target.value)} 
                                    />
                                    {!!errors.phoneNumber && <p className="text-red-500 text-xs italic">{errors.phoneNumber}</p>}
                                </div>

                                <button 
                                    className="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full" 
                                    type="button" 
                                    onClick={handleSubmit}
                                    disabled={loading || !fullName || !email || !phoneNumber}
                                >
                                    Xác Nhận Thanh Toán
                                </button>
                            </form>
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Payment;