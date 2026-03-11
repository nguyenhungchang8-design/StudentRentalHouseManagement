<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Đăng nhập - Hệ thống Quản Lý Nhà Trọ" />
    <title>Đăng Nhập - Quản Lý Nhà Trọ</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            font-family: 'Work Sans', sans-serif;
        }

        /* Color Scheme - Match System */
        :root {
            --primary: #00204a;      /* System Primary - Dark Blue */
            --secondary: #005555;    /* System Secondary - Teal */
            --accent: #00a8a8;       /* Bright Teal for accents */
            --light-bg: #f5f6f7;     /* Light background */
            --border: #e0e4ea;       /* Border color */
            --text-primary: #212529; /* Primary text */
            --text-secondary: #6c757d; /* Secondary text */
            --error: #dc3545;        /* Error color */
        }

        body {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            font-family: 'Work Sans', sans-serif;
        }

        /* Animated background elements */
        .bg-shape-1 {
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            top: -100px;
            left: -100px;
            animation: float 6s ease-in-out infinite;
        }

        .bg-shape-2 {
            position: absolute;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.04);
            border-radius: 50%;
            bottom: -80px;
            right: -80px;
            animation: float 8s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(20px); }
        }

        .login-container {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 450px;
        }

        .login-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0, 32, 74, 0.25);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 30px 80px rgba(0, 32, 74, 0.35);
        }

        .login-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 40px 30px;
            text-align: center;
        }

        .login-header i {
            font-size: 40px;
            margin-bottom: 15px;
            opacity: 0.95;
        }

        .login-header h1 {
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 8px;
            letter-spacing: 0.3px;
        }

        .login-header p {
            font-size: 13px;
            opacity: 0.95;
            margin: 0;
            font-weight: 400;
        }

        .login-body {
            padding: 40px;
            background: white;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 6px;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        .form-label i {
            color: var(--secondary);
        }

        .form-control {
            height: 48px;
            border: 2px solid var(--border);
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            padding: 12px 16px;
            background: white;
        }

        .form-control:focus {
            border-color: var(--secondary);
            box-shadow: 0 0 0 4px rgba(0, 85, 85, 0.08);
            outline: none;
        }

        .form-control::placeholder {
            color: #999;
        }

        .btn-login {
            width: 100%;
            height: 48px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 10px 25px rgba(0, 32, 74, 0.25);
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, var(--secondary) 0%, var(--primary) 100%);
            transform: translateY(-2px);
            box-shadow: 0 15px 35px rgba(0, 32, 74, 0.35);
            color: white;
            text-decoration: none;
        }

        .btn-login:active {
            transform: translateY(0px);
        }

        .alert-danger {
            background-color: #fff5f5;
            border: 1px solid #f5a5a5;
            border-radius: 8px;
            color: var(--error);
            padding: 12px 16px;
            margin-bottom: 20px;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-danger i {
            font-size: 18px;
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            font-size: 13px;
        }

        .form-check {
            margin: 0;
        }

        .form-check-input {
            width: 18px;
            height: 18px;
            margin-top: 2px;
            cursor: pointer;
            border: 2px solid var(--border);
            border-radius: 4px;
        }

        .form-check-input:checked {
            background-color: var(--secondary);
            border-color: var(--secondary);
        }

        .form-check-label {
            cursor: pointer;
            font-weight: 500;
            color: var(--text-secondary);
            margin-left: 6px;
        }

        .forgot-password {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .forgot-password:hover {
            color: var(--primary);
            text-decoration: underline;
        }

        .login-footer {
            background: var(--light-bg);
            padding: 20px;
            text-align: center;
            border-top: 1px solid var(--border);
            font-size: 13px;
            color: var(--text-secondary);
        }

        .login-footer a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .login-footer a:hover {
            color: var(--primary);
            text-decoration: underline;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 25px 0;
            color: #ccc;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .divider span {
            padding: 0 12px;
            font-size: 12px;
            color: var(--text-secondary);
            font-weight: 500;
        }

        .social-login {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .social-btn {
            flex: 1;
            height: 44px;
            border: 1px solid var(--border);
            border-radius: 6px;
            background: white;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 18px;
            color: var(--text-secondary);
        }

        .social-btn:hover {
            border-color: var(--secondary);
            background: var(--light-bg);
            color: var(--secondary);
        }

        /* Loading animation */
        .spinner-border {
            display: none;
            margin-right: 8px;
        }

        .btn-login.loading {
            opacity: 0.7;
            pointer-events: none;
        }

        .btn-login.loading .spinner-border {
            display: inline-block;
        }

        /* Responsive */
        @media (max-width: 576px) {
            .login-container {
                max-width: 90%;
            }

            .login-body {
                padding: 25px;
            }

            .login-header {
                padding: 30px 20px;
            }

            .login-header h1 {
                font-size: 22px;
            }

            .login-header i {
                font-size: 32px;
            }

            .remember-forgot {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .forgot-password {
                align-self: flex-end;
                margin-top: 5px;
            }
        }
    </style>
</head>
<body>
    <!-- Animated background shapes -->
    <div class="bg-shape-1"></div>
    <div class="bg-shape-2"></div>

    <!-- Login Container -->
    <div class="login-container">
        <div class="login-card">
            <!-- Header -->
            <div class="login-header">
                <i class="fas fa-building"></i>
                <h1>Quản Lý Nhà Trọ</h1>
                <p>Hệ thống quản lý ký túc xá & nhà cho thuê</p>
            </div>

            <!-- Body -->
            <div class="login-body">
                <!-- Error Message -->
                <% String error = (String)request.getAttribute("error");%>
                <% if (error != null){ %>
                <div class="alert-danger">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= error %>
                </div>
                <% } %>

                <!-- Login Form -->
                <form action="${pageContext.request.contextPath}/login" method="POST" id="loginForm">
                    <!-- Email Input -->
                    <div class="form-group">
                        <label class="form-label" for="email">
                            <i class="fas fa-envelope"></i>
                            Email
                        </label>
                        <% String email = (String)request.getAttribute("email");%>
                        <input 
                            type="email" 
                            class="form-control" 
                            id="email" 
                            name="email" 
                            placeholder="Nhập email của bạn"
                            value="<%= (email != null) ? email : "" %>"
                            required 
                            autofocus>
                    </div>

                    <!-- Password Input -->
                    <div class="form-group">
                        <label class="form-label" for="password">
                            <i class="fas fa-lock"></i>
                            Mật khẩu
                        </label>
                        <input 
                            type="password" 
                            class="form-control" 
                            id="password" 
                            name="password" 
                            placeholder="Nhập mật khẩu của bạn"
                            required>
                    </div>

                    <!-- Remember & Forgot -->
                    <div class="remember-forgot">
                        <label class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <span class="form-check-label">Ghi nhớ tôi</span>
                        </label>
                        <a href="#" class="forgot-password">
                            <i class="fas fa-question-circle"></i> Quên mật khẩu?
                        </a>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-login">
                        <i class="fas fa-sign-in-alt"></i>
                        Đăng Nhập
                    </button>
                </form>

                <!-- Divider -->
                <div class="divider">
                    <span>hoặc</span>
                </div>

                <!-- Social Login (Optional) -->
                <div class="social-login">
                    <button class="social-btn" title="Đăng nhập bằng Google" type="button">
                        <i class="fab fa-google"></i>
                    </button>
                    <button class="social-btn" title="Đăng nhập bằng Facebook" type="button">
                        <i class="fab fa-facebook-f"></i>
                    </button>
                </div>
            </div>

            <!-- Footer -->
            <div class="login-footer">
                Chưa có tài khoản? <a href="register.jsp">Đăng ký tại đây</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Login Form Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Focus on email input
            const emailInput = document.getElementById('email');
            if (emailInput && !emailInput.value) {
                emailInput.focus();
            }

            // Form submit handler
            const loginForm = document.getElementById('loginForm');
            loginForm.addEventListener('submit', function() {
                const submitBtn = loginForm.querySelector('.btn-login');
                submitBtn.classList.add('loading');
                submitBtn.disabled = true;
            });

            // Remember me functionality
            const rememberMe = document.getElementById('rememberMe');
            const savedEmail = localStorage.getItem('rememberedEmail');
            
            if (savedEmail) {
                emailInput.value = savedEmail;
                rememberMe.checked = true;
            }

            rememberMe.addEventListener('change', function() {
                if (this.checked && emailInput.value) {
                    localStorage.setItem('rememberedEmail', emailInput.value);
                } else {
                    localStorage.removeItem('rememberedEmail');
                }
            });
        });
    </script>
</body>
</html>
