-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
SELECT Product.ProductName, Category.CategoryName
FROM Product
JOIN Category ON Product.CategoryID = Category.ID;


-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
SELECT [Order].Id, Shipper.CompanyName
FROM [Order]
JOIN [Shipper] ON [Order].ShipVia = Shipper.ID
WHERE [Order].OrderDate < '2012-08-09';

-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
SELECT 
  Product.ProductName,
  COUNT(*) AS ProductCount
FROM 
  [Order]
JOIN 
  OrderDetail ON [Order].Id = OrderDetail.OrderId
JOIN 
  Product ON OrderDetail.ProductId = Product.Id
WHERE 
  [Order].Id = 10251
GROUP BY 
  Product.ProductName;
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
SELECT 
  [Order].Id,
  Customer.CompanyName,
  Employee.LastName AS "Employee's LastName"
FROM 
  [Order]
JOIN 
  Customer ON [Order].CustomerId = Customer.Id
JOIN 
  Employee ON [Order].EmployeeId = Employee.Id;
