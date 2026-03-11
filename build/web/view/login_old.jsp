
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="favicon.png" />

    <meta name="description" content="Đăng nhập vào Bất Động Sản VN" />
    <meta name="keywords" content="bất động sản, đăng nhập, tài khoản" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="../fonts/icomoon/style.css" />
    <link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="../css/tiny-slider.css" />
    <link rel="stylesheet" href="../css/aos.css" />
    <link rel="stylesheet" href="../css/style.css" />

    <style>
      /* Nút đăng nhập/đăng ký - kiểu nổi */
      .btn-glow {
        position: relative;
        box-shadow: 0 8px 22px rgba(0, 123, 255, 0.15);
        transition: transform .14s ease, box-shadow .14s ease;
      }
      .btn-glow:hover { transform: translateY(-4px); box-shadow: 0 18px 36px rgba(0,123,255,0.18); }
      .auth-card { max-width:420px; margin:60px auto; }
      .brand { font-weight:700; letter-spacing:1px; }
    </style>

    <title>Đăng nhập — Bất Động Sản VN</title>
  </head>
  <body>
    <!-- Login card -->
    <div class="auth-card">
      <div class="card shadow-sm">
        <div class="card-body p-4">
          <h3 class="mb-3 text-center">Đăng nhập</h3>
          <p class="text-center text-muted small mb-4">Đăng nhập để quản lý tin đăng và hồ sơ của bạn</p>

          <form action="${pageContext.request.contextPath}/login" method="POST">
                                        <h2>Đăng nhập</h2>

                                        <label for="email">Email:</label>
                                        <% String email = (String)request.getAttribute("email");%>
                                        <% if (email != null) {%>
                                        <input type="text" id="email" name="email" value="<%= email%>" required>
                                        <% }else{%>
                                        <input type="text" id="email" name="email" required>
                                        <% } %>

                                        <label for="password">Mật khẩu:</label>
                                        <input type="password" id="password" name="password" required>

                                        
                                            <button type="submit">Đăng Nhập</button>
                                            
                                            <% String error = (String)request.getAttribute("error");%>
                                        <% if (error != null){%>
                                        <label>Error:</label>
                                        <i><%= error %></i>
                                            <%} %>
                                            
                                         
                                    </form>

        </div>
      </div>
    </div>

    <!-- Footer (giữ format đơn giản giống index) -->
    <footer class="site-footer bg-light py-4">
      <div class="container text-center">
        <p class="mb-1">Tầng 5, Tòa nhà ABC, 45 Lê Đại Hành, Hà Nội — <a href="tel:+842412345678">+84 24 1234 5678</a></p>
        <p class="mb-0">© <script>document.write(new Date().getFullYear());</script> Bất Động Sản VN</p>
      </div>
    </footer>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script>
      // simple client-side UX: focus vào email khi load
      document.addEventListener('DOMContentLoaded', function(){ var e = document.getElementById('email'); if(e) e.focus(); });
    </script>
  </body>
</html>