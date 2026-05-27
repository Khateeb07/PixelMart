<div align="center">

# 🛒 PixelMart

### Full-Stack Java eCommerce Web Application

Built using **Servlets, JSP, MVC Architecture, AJAX, React.js, and MySQL**

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-323330?style=for-the-badge)
![Servlets](https://img.shields.io/badge/Servlets-6DB33F?style=for-the-badge)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![MySQL](https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![MVC](https://img.shields.io/badge/Architecture-MVC-blue?style=for-the-badge)

</div>

---

# 📌 Overview

PixelMart is a full-stack Java-based eCommerce web application focused heavily on backend engineering concepts and scalable application architecture.

The project demonstrates practical implementation of:

- MVC Architecture
- JDBC Connectivity
- AJAX-based Communication
- React.js Integration
- API-driven Product Import Systems
- Dynamic Product Rendering
- Session Management
- Database-driven Design

The application includes a custom-built product ingestion pipeline that fetches products from external APIs, downloads product images locally, stores metadata inside MySQL, and dynamically renders products on the frontend.

---

# ✨ Features

## 🔐 Authentication & Session Management
- User Registration & Login
- Session-based Authentication
- Logout Functionality
- Role-based Admin Access

---

## 📦 Product Management
- Dynamic Product Catalog
- Category & Subcategory Architecture
- Product Detail Rendering
- API-based Product Import System
- Duplicate Product Detection

---

## 🛠️ Admin Dashboard
- Admin Control Panel
- One-click Product Import
- AJAX-based Admin Operations
- Import Status Handling

---

## 🎨 Frontend
- React.js Product Rendering
- Responsive Bootstrap UI
- Dynamic Product Cards
- Base64 Image Rendering
- AJAX Request Handling

---

## ⚙️ Backend Architecture
- MVC Architecture
- DAO Layer
- Java Beans
- JDBC Connectivity
- Front Controller Pattern

---

# 🧰 Tech Stack

| Category        | Technologies                                     |
|-----------------|--------------------------------------------------|
| **Frontend**    | HTML5, CSS3, Bootstrap, JavaScript, React.js     |
| **Backend**     | Java, Servlets, JSP, JDBC                        |
| **Database**    | MySQL                                            |
| **Server**      | GlassFish Server                                 |
| **Tools**       | Apache NetBeans, Git, GitHub                     |

---

# 🏗️ System Architecture

```text
PixelMart
│
├── controller/
│   └── FrontController.java
│
├── models/
│   ├── ProductLoadModel.java
│   ├── ImportProductsModel.java
│   ├── ProductDetailsModel.java
│   └── LoginModel.java
│
├── dao/
│   └── MyDAO.java
│
├── beans/
│   └── Product.java
│
├── web/
│   ├── index.jsp
│   ├── admin.jsp
│   ├── productdisplay.jsp
│   └── components/
│
└── Database
    └── MySQL (ecommdb)
```

---

# 🔄 Product Import System

PixelMart includes a custom-built product ingestion pipeline that:

1. Fetches product data from external APIs
2. Parses JSON responses
3. Downloads product images locally
4. Inserts product metadata into MySQL database
5. Prevents duplicate product imports

---

# 🚀 Current Implementations

- API-based Product Import System
- Dynamic Product Rendering
- Product Details Architecture
- AJAX-based Product Loading
- Admin Dashboard
- Duplicate Product Detection
- Base64 Image Conversion
- Category Mapping System
- Session Management

---

# 🔮 Future Enhancements

- Shopping Cart
- Wishlist
- Order Management
- Payment Gateway Integration
- Product Reviews & Ratings
- Zoomable Product Gallery
- Multi-image Product Support
- Seller Dashboard
- Stored Procedures & Transaction-based Imports
- Recommendation System

---

# ⚡ Setup Instructions

## 1️⃣ Clone Repository

```bash
git clone https://github.com/khateeb07/pixelmart.git
```

---

## 2️⃣ Configure Database

Create MySQL database:

```sql
CREATE DATABASE ecommdb;
```

Import the required tables into the database.

---

## 3️⃣ Configure JDBC

Update database credentials inside:

```text
MyDAO.java
```

---

## 4️⃣ Configure GlassFish Server

Deploy the project on GlassFish Server using Apache NetBeans.

---

## 5️⃣ Run the Application

Open:

```text
http://localhost:8080/pixelmart
```

---

# 🎯 Learning Objectives

This project was built to strengthen understanding of:

- Java Web Development
- MVC Architecture
- JDBC
- Database Design
- API Integration
- AJAX & React Integration
- Session Management
- Backend System Design

---

# 👨‍💻 Author

### Khateeb Aamir Usmani

- GitHub: https://github.com/khateeb07
- LinkedIn: https://linkedin.com/in/khateeb07

---

# 📄 License

Licensed under the MIT License.
