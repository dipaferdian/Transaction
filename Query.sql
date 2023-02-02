drop table if exists Transaction;
drop table if exists Wholesaler;
drop table if exists Courier;

CREATE TABLE Courier (
  id INT PRIMARY KEY,
  CourierServiceName VARCHAR(50) NOT NULL,
  Description VARCHAR(200) NOT NULL,
  Phone_No VARCHAR(20) NOT NULL
);

CREATE TABLE Wholesaler (
  id INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Fullname VARCHAR(100) NOT NULL,
  Phone_No VARCHAR(20) NOT NULL,
  CourierService_id INT NOT NULL,
  FOREIGN KEY (CourierService_id) REFERENCES Courier(id)
);

CREATE TABLE Transaction (
  id INT PRIMARY KEY,
  Trx_id VARCHAR(20) NOT NULL,
  Wholesaler_id INT NOT NULL,
  Date_Order DATE NOT NULL,
  DeliveryService_id INT NOT NULL,
  FOREIGN KEY (Wholesaler_id) REFERENCES Wholesaler(id),
  FOREIGN KEY (DeliveryService_id) REFERENCES Courier(id)
);


INSERT INTO Courier (id, CourierServiceName, Description, Phone_No)
VALUES
  (4, 'JNE Reguler', 'Reguler adalah layanan pengiriman dengan...', '+6221873xxx'),
  (6, 'JNE YES', 'YES adalah layanan dengan waktu...', '+6221873xxx'),
  (5, 'JNE SS', 'SUPER SPEED (SS) adalah layanan pengiriman...', '+6221873xxx');


INSERT INTO Wholesaler (id, Name, Fullname, Phone_No, CourierService_id)
VALUES
  (6, 'Bedjo', 'Bedjo Sujatmiko', '+62874857849xx', 4),
  (7, 'Budi', 'Budi Gunawan', '+62874857111xx', 6),
  (8, 'Bambang', 'Bambang Arianto', '+62874857222xx', 5);

INSERT INTO Transaction (id, Trx_id, Wholesaler_id, Date_Order, DeliveryService_id)
VALUES
  (1, 'DX01.005.011', 6, '2020-03-05', 4),
  (2, 'DX01.006.009', 7, '2020-04-05', 5),
  (3, 'DX01.007.209', 8, '2020-04-05', 6);

SELECT Trx_id, Name, Fullname, Date_Order, DeliveryService_id
FROM Transaction
JOIN Wholesaler
ON Transaction.Wholesaler_id = Wholesaler.id
WHERE Trx_id = 'DX01.006.009';