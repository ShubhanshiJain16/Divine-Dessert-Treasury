CREATE TABLE User (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255),
    phone VARCHAR(20),
    password VARCHAR(255)
);
CREATE TABLE Login (
    phone VARCHAR(20),
    password VARCHAR(255),
    PRIMARY KEY (phone),
    FOREIGN KEY (phone) REFERENCES User(phone)
);
CREATE TABLE Pays_Bill (
    uid INT,
    billid INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE Payment (
    uid INT,
    amount DECIMAL(10, 2),
    method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE Sweets (
    sweetname VARCHAR(255) PRIMARY KEY,
    category VARCHAR(255),
    availability BOOLEAN
);
CREATE TABLE Orders (
    uid INT,
    oid INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    deliverydate DATE,
    status VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE OrderSweets (
    uid INT,
    sweetname VARCHAR(255),
    qty INT,
    price DECIMAL(10, 2),
    amount DECIMAL(10, 2),
    FOREIGN KEY (uid) REFERENCES User(uid),
    FOREIGN KEY (sweetname) REFERENCES Sweets(sweetname)
);
CREATE TABLE Address (
    uid INT,
    housenumber VARCHAR(50),
    locality VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    FOREIGN KEY (uid) REFERENCES User(uid)
);
