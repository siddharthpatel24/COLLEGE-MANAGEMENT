# 🎓 College Management System

A web-based College Management System developed using **Java Servlets, JSP, JDBC, MySQL, HTML, CSS, and JavaScript**. The application provides separate interfaces for **Admin**, **Staff**, and **Students** to efficiently manage academic records, attendance, marks, and online book purchases with secure OTP verification.

---

## 📌 Features

### 👨‍💼 Admin Module
- Secure Admin Login
- Staff Management (Add, Update, Delete, View)
- Student Management (Add, Update, Delete, View)
- Manage Student Information
- Manage Staff Information

### 👨‍🏫 Staff Module
- Staff Login
- View Student Details
- Mark Student Attendance
- Enter Student Marks
- View Attendance Records
- View Marks

### 👨‍🎓 Student Module
- Student Login
- View Personal Profile
- View Attendance
- View Marks
- Purchase Books Online

### 💳 Online Book Purchase Module
- Credit Card Verification
- OTP Generation
- Email OTP Delivery using JavaMail API
- OTP Verification
- Secure Payment Confirmation
- Session-Based Authentication

---

# 🛠 Technologies Used

### Frontend
- HTML5
- CSS3
- JavaScript
- JSP

### Backend
- Java Servlets
- JDBC

### Database
- MySQL

### Server
- Apache Tomcat 7

### APIs & Libraries
- JavaMail API
- MySQL Connector/J

---

# 📂 Project Structure

```
CollegeManagementSystem/
│
├── admin/
├── staff/
├── student/
├── payment/
├── images/
├── css/
│
├── WEB-INF/
│   ├── src/
│   │   ├── LoginServlet.java
│   │   ├── PaymentServlet.java
│   │   └── VerifyOTPServlet.java
│   │
│   ├── classes/
│   ├── lib/
│   └── web.xml
│
├── index.jsp
└── README.md
```

---

# 📊 Database

Database Name

```
backend
```

Main Tables

- prjstudent
- staff
- attendance
- marks
- payments

---

# 🔐 OTP Payment Flow

```
Student
     │
     ▼
Buy Books
     │
     ▼
Enter Card Details
     │
     ▼
PaymentServlet
     │
     ├── Verify Card
     ├── Generate OTP
     ├── Store OTP in MySQL
     ├── Send OTP to Registered Email
     └── Redirect to OTP Page
                │
                ▼
          VerifyOTPServlet
                │
                ├── Verify OTP
                ├── Validate Session
                └── Payment Success
```

---

# 🚀 How to Run

### Prerequisites

- JDK 7 or JDK 8
- Apache Tomcat 7
- MySQL Server
- MySQL Workbench (Optional)
- Eclipse / VS Code

---

### Steps

1. Clone the repository

```
git clone <repository-url>
```

2. Import the project into your IDE.

3. Create the MySQL database

```
CREATE DATABASE backend;
```

4. Import the required SQL tables.

5. Copy the MySQL Connector and JavaMail JAR files into

```
WEB-INF/lib
```

6. Configure the database credentials inside the Servlets.

```java
jdbc:mysql://localhost:3306/backend

Username:
siddharth

Password:
1234
```

7. Start Apache Tomcat.

8. Open

```
http://localhost:8080/CSMprg/
```

---

# 📷 Modules

✔ Admin Dashboard

✔ Staff Dashboard

✔ Student Dashboard

✔ Attendance Management

✔ Marks Management

✔ Online Book Store

✔ OTP Email Verification

---

# Future Enhancements

- Online Fee Payment
- PDF Receipt Generation
- SMS OTP Integration
- Password Encryption
- REST API Integration
- Spring Boot Migration
- Role-Based Authorization
- Dashboard Analytics

---

# Learning Outcomes

Through this project, I gained hands-on experience with:

- Java Servlets
- JSP
- JDBC
- MySQL
- Session Management
- JavaMail API
- Email OTP Authentication
- CRUD Operations
- MVC-based Web Application Development
- Apache Tomcat Deployment

---

# Author

**Pulishetti Siddhartha**

B.Tech Computer Science & Engineering

Vidya Jyothi Institute of Technology

GitHub: https://github.com/siddharthpatel24

LinkedIn: *(Add your LinkedIn URL here)*

Email: *(Add your Email Address here)*

---

## ⭐ If you found this project useful, consider giving it a star on GitHub.
