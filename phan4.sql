use demo2006;
ALTER TABLE `order`
ADD gia_tri FLOAT;
UPDATE `order` o
JOIN (
    SELECT 
        o.id,
        SUM(p.price * od.quantity) AS gia_tri
    FROM `order` o 
    JOIN orderdetail od ON o.id = od.orderId
    JOIN product p ON p.id = od.productId
    GROUP BY o.id
) t ON o.id = t.id
SET o.gia_tri = t.gia_tri
WHERE o.id IS NOT NULL;
SET SQL_SAFE_UPDATES = 0;
select * from `order` o where o.time between '2006-06-19' and '2006-06-20';
/*In ra các mã hóa đơn, trị giá hóa đơn trong tháng 6/2006, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần)*/
select * from `order` o where o.time between '2006-06-1' and '2006-06-30' order by o.time, o.gia_tri desc;
/*In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 19/06/2007*/
select c.id, c.name, o.time from customer c 
join `order` o on c.id=o.customerId
where o.time = '2007-06-19'
group by c.id;
-- In ra danh sách các sản phẩm (MASP, TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
select p.id,p.name as 'productName',c.name as 'CustomerName' from product p 
join orderdetail od on od.productId=p.id
join `order` o on o.id=od.orderId
join customer c on c.id=o.customerId
where c.name='Anh Đào' and o.time between '2006-06-01' and '2006-06-30'
group by p.id;
-- Tìm các hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”.
select o.id as 'order_id',p.name as 'productname' from `order` o 
join orderdetail od on od.orderId=o.id
join product p on p.id=od.productId
where p.name ='Máy giặt' or p.name='Tủ lanh';
