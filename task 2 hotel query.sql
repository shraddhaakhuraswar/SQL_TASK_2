CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    date_of_birth DATE,
    room_id INT,
    reservation_id INT
	
	)

INSERT INTO Guests (guest_id, name, email, phone_number, address, date_of_birth, room_id, reservation_id)
VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', '9876543210', '123 MG Road, Delhi', '1990-01-15', 101, 1),
(2, 'Sneha Patel', 'sneha.patel@example.com', '9876543211', '456 Nehru Street, Mumbai', '1985-05-10', 102, 2),
(3, 'Rajesh Kumar', 'rajesh.kumar@example.com', '9876543212', '789 Gandhi Nagar, Bangalore', '1988-07-20', 103, 3),
(4, 'Priya Singh', 'priya.singh@example.com', '9876543213', '101 Ambedkar Road, Hyderabad', '1992-03-25', 104, 4),
(5, 'Vikram Reddy', 'vikram.reddy@example.com', '9876543214', '202 Tagore Street, Chennai', '1991-11-30', 105, 5),
(6, 'Kiran Desai', 'kiran.desai@example.com', '9876543215', '303 Park Avenue, Delhi', '1993-04-12', 106, 6),
(7, 'Meera Nair', 'meera.nair@example.com', '9876543216', '505 Marine Drive, Mumbai', '1986-06-18', 107, 7),
(8, 'Arjun Mehta', 'arjun.mehta@example.com', '9876543217', '607 Residency Road, Bangalore', '1990-09-05', 108, 8),
(9, 'Divya Gupta', 'divya.gupta@example.com', '9876543218', '809 Jubilee Hills, Hyderabad', '1995-11-15', 109, 9),
(10, 'Sandeep Joshi', 'sandeep.joshi@example.com', '9876543219', '910 Anna Salai, Chennai', '1987-02-23', 110, 10),
(11, 'Ritu Verma', 'ritu.verma@example.com', '9876543220', '111 Cantonment Road, Pune', '1992-12-20', 111, 11),
(12, 'Nikhil Shah', 'nikhil.shah@example.com', '9876543221', '213 MG Road, Kolkata', '1991-07-07', 112, 12),
(13, 'Anita Rao', 'anita.rao@example.com', '9876543222', '314 Brigade Road, Bangalore', '1989-03-30', 113, 13),
(14, 'Vivek Aggarwal', 'vivek.aggarwal@example.com', '9876543223', '415 Linking Road, Mumbai', '1994-08-08', 114, 14),
(15, 'Lakshmi Menon', 'lakshmi.menon@example.com', '9876543224', '516 Mount Road, Chennai', '1988-01-18', 115, 15);

select * from Guests

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    check_in_date DATE,
    check_out_date DATE,
    guest_id INT,
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    booking_date DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id)
)
INSERT INTO Reservations (reservation_id, check_in_date, check_out_date, guest_id, total_amount, payment_status, booking_date)
VALUES
(1, '2024-06-01', '2024-06-05', 1, 20000.00, 'Paid', '2024-05-25'),
(2, '2024-06-06', '2024-06-10', 2, 15000.00, 'Paid', '2024-05-30'),
(3, '2024-06-11', '2024-06-15', 3, 25000.00, 'Unpaid', '2024-06-01'),
(4, '2024-06-16', '2024-06-20',4, 18000.00, 'Paid', '2024-06-05'),
(5, '2024-06-21', '2024-06-25', 5, 22000.00, 'Unpaid', '2024-06-10'),
(6, '2024-06-26', '2024-06-30', 6, 17000.00, 'Paid', '2024-06-15'),
(7, '2024-07-01', '2024-07-05', 7, 19000.00, 'Unpaid', '2024-06-20'),
(8, '2024-07-06', '2024-07-10', 8, 22000.00, 'Paid', '2024-06-25'),
(9, '2024-07-11', '2024-07-15', 9, 14000.00, 'Paid', '2024-07-01'),
(10, '2024-07-16', '2024-07-20', 10, 18000.00, 'Unpaid', '2024-07-05'),
(11, '2024-07-21', '2024-07-25', 11, 20000.00, 'Paid', '2024-07-10'),
(12, '2024-07-26', '2024-07-30', 12, 21000.00, 'Paid', '2024-07-15'),
(13, '2024-08-01', '2024-08-05', 13, 16000.00, 'Unpaid', '2024-07-20'),
(14, '2024-08-06', '2024-08-10', 14, 23000.00, 'Paid', '2024-07-25'),
(15, '2024-08-11', '2024-08-15', 15, 25000.00, 'Paid', '2024-08-01');

select * from Reservations

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    type VARCHAR(50),
    price_per_night DECIMAL(10, 2),
    status VARCHAR(20),
    floor INT,
    bed_count INT,
    reservation_id INT,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
)
INSERT INTO Rooms (room_id, room_number, type, price_per_night, status, floor, bed_count, reservation_id)
VALUES
(101, '101', 'Single', 2000.00, 'Occupied', 1, 1, 1),
(102, '102', 'Double', 3000.00, 'Occupied', 1, 2, 2),
(103, '103', 'Suite', 5000.00, 'Occupied', 2, 3, 3),
(104, '104', 'Single', 2000.00, 'Occupied', 2, 1, 4),
(105, '105', 'Double', 3000.00, 'Occupied', 3, 2, 5),
(106, '106', 'Suite', 5000.00, 'Occupied', 3, 3, 6),
(107, '107', 'Single', 2000.00, 'Occupied', 3, 1, 7),
(108, '108', 'Double', 3000.00, 'Occupied', 4, 2, 8),
(109, '109', 'Single', 2000.00, 'Occupied', 4, 1, 9),
(110, '110', 'Suite', 5000.00, 'Occupied', 4, 3, 10),
(111, '111', 'Double', 3000.00, 'Occupied', 5, 2, 11),
(112, '112', 'Single', 2000.00, 'Occupied', 5, 1, 12),
(113, '113', 'Double', 3000.00, 'Occupied', 5, 2, 13),
(114, '114', 'Suite', 5000.00, 'Occupied', 6, 3, 14),
(115, '115', 'Single', 2000.00, 'Occupied', 6, 1, 15);
	

select * from Rooms

ALTER TABLE Guests
ADD CONSTRAINT FK_Rooms FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
ADD CONSTRAINT FK_Reservations FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id);


