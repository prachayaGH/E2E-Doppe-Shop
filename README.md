# 🤖 Doppee Shop E2E Test Automation

## 📋 Project Overview
Robot Framework test automation suite for Doppee Shop e-commerce platform, implementing Page Object Model (POM) design pattern with parallel execution support.

**Target Website:** https://training-platform2.doppio-tech.com/

---

## ✨ Key Features
- ✅ **2 Complete E2E Test Cases** - Search and checkout flow validation
- ✅ **Page Object Model (POM)** - Clean separation of locators and page keywords
- ✅ **Price Validation** - Automated checkout calculation verification
- ✅ **Reliable & Repeatable** - Tests pass consistently (3+ consecutive runs)

---

## 🏗️ Project Structure

```
project-root/
│
├── resources/
│      │
│      ├── variables.robot                      # Stores common variables (e.g., URLs, credentials, browser settings) 
│      │                                          and often reusable setup/teardown keywords.
│      │      
│      ├── pages/
│      │    ├── login_page.robot               # Login page keywords
│      │    ├── search_page.robot              # Search functionality keywords
│      │    ├── product_page.robot             # Product detail keywords
│      │    ├── cart_page.robot                # Shopping cart keywords
│      │    └── checkout_page.robot            # Checkout & price validation
│      │
│      └── locators/
│           ├── login_locators.robot           # Login page element locators
│           ├── search_locators.robot          # Search element locators
│           ├── product_locators.robot         # Product page locators
│           ├── cart_locators.robot            # Cart page locators
│           ├── checkout_locators.robot        # Checkout page locators
│           └── logout_locators.robot          # Logout page locators
│
├── tests/
│   ├── test_ceramic_mug_autocomplete.robot          # Main test suite
│   └── test_ceramic_mug_search.robot 
│
│
├── requirements.txt                   # Python dependencies
├── README.md                          # This file
└── .gitignore                         # Git ignore rules
```

---

## 🔧 Prerequisites

### Required Software
- **Python 3.8+** ([Download](https://www.python.org/downloads/))
- **pip** (comes with Python)
- **Chrome Browser** (latest version)
- **ChromeDriver** (automatically managed by webdrivermanager)

### Check Python Installation
```bash
python --version
pip --version
```

---

## 📦 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/prachayaGH/E2E-Doppe-Shop.git
cd DoppeShopTest

```

### 2. Create Virtual Environment (Recommended)
```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

**requirements.txt contents:**
```
robotframework
robotframework-seleniumlibrary
pabot
selenium
```

### 4. Setup WebDriver
```bash
webdrivermanager chrome
```

---

## 🚀 Running Tests

### Basic Execution
```bash
robot test_ceramic_mug_autocomplete.robot
```

### Basic Execution
```bash
robot test_ceramic_mug_search.robot
```

---

## 🧪 Test Cases

### Test Case 1: Search with Autocomplete
1. Login to the application
2. Search "mug" and wait for autocomplete
3. Click "Ceramic Mug" from autocomplete suggestions
4. Select color and add 3 items to cart
5. Proceed to checkout
6. Verify price calculation: `subtotal - discount + shipping = total`
7. logout to the application

### Test Case 2: Direct Search
1. Login to the application
2. Search "Ceramic Mug" directly (press Enter)
3. Select color and add 3 items to cart
4. Proceed to checkout
5. Verify price calculation: `subtotal - discount + shipping = total`
6. logout to the application

---

## ✅ Test Validation

### Price Calculation Formula
```
Total = Subtotal - Discount + Shipping
```

---


## 📹 Demo Video

**Video shows:**
- ✅ Test execution (both sequential and parallel)
- ✅ All tests passing (green status)
- ✅ Price validation assertions
- ✅ Generated reports

**Video location:** `https://drive.google.com/file/d/1c1t2PD36KskjuJ-u8lQ1WQUmw3szGADg/view?usp=sharing`

---

## 👤 Test Credentials

```
Email: test@gmail.com
Password: Test123456
```

---


## 📞 Contact

**Your Name**  
📧 prachaya.ksp@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/prachaya-kosolpattrapak-286654326/)  
💻 [GitHub](https://github.com/prachayaGH)

---

## 📄 License

This project is created for interview/assessment purposes.

---

**Last Updated:** October 2025  
**Status:** 