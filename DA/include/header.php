<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSO Accreditation - Register</title>
    <link rel="icon" type="image/x-icon" href="images/logo.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: rgb(1, 82, 51);
            margin: 0;
            padding: 5px 70px;
        }
        .navbar a {
            color: white;
            opacity: 100%;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: rgb(2, 77, 48);
            text-decoration: none;
        }
        .navbar-toggler {
            border: none;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 0.5%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .navbar-collapse {
            background-color: rgb(1, 82, 51);
        }
        .navbar-nav .nav-item {
            margin: 0;
            padding: 0px 8px;
        }
        .navbar-nav .nav-item .nav-link {
            color: white;
            text-decoration: none;
        }
        .navbar-nav .nav-item .nav-link:hover {
            background-color: rgb(2, 77, 48);
        }
        .dropdown-menu {
            background-color: rgb(1, 82, 51);
            border: none;
            border-radius: 0;
        }
        .dropdown-item {
            color: white;
            text-decoration: none;
        }
        .dropdown-item:hover {
            background-color: rgb(2, 77, 48);
            color: white;
        }
        .navbar-nav .dropdown-menu .dropdown-item:hover {
            background-color: rgb(2, 77, 48);
        }
        .dropdown-submenu {
            position: relative;
        }
        .dropdown-submenu .dropdown-menu {
            display: none;
            position: absolute;
            top: 0;
            left: 100%;
            margin-top: -1px;
        }
        .dropdown-submenu:hover .dropdown-menu {
            display: block;
        }
        .dropdown-menu-parent {
            display: none;
        }
        .dropdown:hover .dropdown-menu-parent {
            display: block;
        }
        .govph-box {
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.2);
            padding: 5px 20px;
            background-color: rgb(2, 95, 59);
        }
        .yellow-line {
            background-color: rgb(253, 199, 5);
            height: 7px;
            width: 100%;
            margin: 0;
            padding: 0;
        }
        .banner {
            position: relative;
            width: 100%;
            padding-bottom: 11.95%;
            overflow: hidden;
        }
        .banner img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .section-background {
            background-image: url('images/background.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .section-background::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.88);
            z-index: 0;
        }
        .signup-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 0;
        }
        .signup-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            text-align: center;
            position: relative;
            z-index: 1;
        }
        .signup-form img {
            width: 60px;
            height: 60px;
            margin-bottom: 20px;
            border-radius: 50%;
        }
        .signup-form h2 {
            margin-bottom: 32px;
            color: black;
            font-weight: bold;
            font-size: 1.5em;
        }
        .signup-form h4 {
            margin-bottom: 20px;
            color: rgb(1, 82, 51);
            font-weight: bold;
            font-size: 1.2em;
        }

        .login-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 0;
        }
        .login-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
            position: relative;
            z-index: 1;
        }
        .login-form img {
            width: 60px;
            height: 60px;
            margin-bottom: 20px;
            border-radius: 50%;
        }
        .login-form h2 {
            margin-bottom: 32px;
            color: black;
            font-weight: bold;
            font-size: 1.5em;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
            font-size: 0.875em;
        }
      
      
        .form-navigation{
            background-color: green;
            padding: 10px 20px;
            font-size: 0.875em;
            transition: background-color 0.3s, color 0.3s, text-decoration 0.3s;
            border-radius: 5px;
            cursor: pointer;
            border: none; 
            outline: none; 
        }
    
        .form-check-input {
            align-content: left;
        }
        .form-check-label {
            color: gray;
            font-size: 0.75em;
        }
        .form-step {
            display: none;
        }
        .form-step-active {
            display: block;
        }
        .form-step-title {
            font-size: 1.2em;
            font-weight: bold;
            color: rgb(1, 82, 51);
            margin-bottom: 20px;
            text-align: left;
        }
        .redirect-message {
            margin-top: 20px;
        }
        .redirect-message a {
            color: rgb(1, 82, 51);
            text-decoration: none;
            font-weight: bold;
        }
        .redirect-message a:hover {
            text-decoration: underline;
        }
        .footer {
            background-color: white;
            color: white;
            padding: 0;
        }
        .footer-top {
            background: url('images/footer_background.jpg') repeat bottom;
            background-size: auto;
            background-attachment: fixed;
            padding: 52px 0;
            display: flex;
            align-items: flex-start;
        }
        .footer-logo {
            flex: 0 0 auto;
            padding-left: 20px;
            margin-right: 20px;
            padding-bottom: 85px;
            display: flex;
            align-items: flex-start;
        }
        .footer-logo img {
            height: 140px;
        }
        .footer-content {
            flex: 1 1 auto;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .footer-bottom {
            background-color: white;
            padding: 10px 0;
        }
        .footer-bottom p {
            color: black;
            margin: 0;
        }
        .footer-title {
            font-weight: bold;
            font-size: 1.5em;
            margin-bottom: 10px;
        }
        .footer-section {
            padding: 20px;
            text-align: left;
        }
        .footer-section ul {
            list-style-type: none;
            padding: 0;
        }
        .footer-section ul li {
            margin-bottom: 5px;
        }
        .footer-section ul li::before {
            content: '• ';
            color: white;
        }
        .footer-section ul li a {
            color: white;
            text-decoration: none;
        }
        .footer-section ul li a:hover {
            text-decoration: underline;
        }
        .tab-content-wrapper {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            flex: 1;
        }
        .nav-tabs .nav-link {
            color: rgb(1, 82, 51);
        }
        .nav-tabs .nav-link.active {
            color: rgb(1, 82, 51);
        }
        .tab-pane .section-item {
            border: none;
        }
        @media (max-width: 768px) {
            .section-item {
                padding: 15px;
            }
            .combined-card-content {
                padding: 15px;
            }
            .dropdown-menu {
                position: static;
                float: none;
            }
            .dropdown-submenu .dropdown-menu {
                margin-left: 0;
            }
            .dropdown-menu .dropdown-submenu:hover .dropdown-menu {
                display: block;
                position: relative;
            }
        }
        .wider-col-md-8 {
            flex: 0 0 70%;
            max-width: 70%;
        }

        .dropdown-toggle::after {
            display: none !important;
        }

        .navbar-nav .dropdown:hover > .dropdown-menu {
            display: block;
        }
        .dropdown-menu .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }

        .dropdown-menu-right {
            right: 0;
            left: auto;
        }
        .dropdown-menu-left {
            right: auto;
            left: 0;
        }

        @media (max-width: 768px) {
            .dropdown-menu {
                position: static;
                float: none;
            }
            .dropdown-submenu .dropdown-menu {
                left: auto;
                right: 0;
                margin-left: 0;
                margin-right: 0;
            }
        }
        .button-box {
        width: 450px;
        margin: 35px auto;
        position: relative;
        box-shadow: 0 0 20px 9px rgba(59, 173, 89, 0.1); /* Adjust the RGBA values for the desired color */
        border-radius: 30px;
        display: flex;
        justify-content: space-between;
    }

    .toggle-btn {
        padding: 10px 30px;
        cursor: pointer;
        background: transparent;
        border: 0;
        outline: none;
        position: relative;
        z-index: 1;
        transition: .5s;
    }

    .toggle-btn.active {
        color: white;
    }

    #btn {
        top: 0;
        left: 0;
        position: absolute;
        width: 230px;
        height: 100%;
        background: linear-gradient(to right, #bf9000, #006400);
        border-radius: 30px;
        transition: .5s;
        z-index: 0;
        border: none;
    }

    .form-container {
        display: none;
    }

    .form-container.active {
        display: block;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;

    }

    .submit-btn {
        background-color: green;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: block;
        width: 100%;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s, color 0.3s;
    }

    .submit-btn:hover {
        background-color: #006400;
        color: white;
    }

    .success {
        color: blue;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .status {
        color: red;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .error-message{
        color: red;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .btn-custom {
            background-color: rgb(1, 82, 51);
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px; 
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px; 
            width: 100%;
        }
        .btn-custom:hover {
            color: white;
            text-decoration: underline;
        }
    </style>
</head>
<body>