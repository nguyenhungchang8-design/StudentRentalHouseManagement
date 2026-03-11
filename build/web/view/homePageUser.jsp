<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Kiểm tra đăng nhập
    Object userObj = session.getAttribute("loggedInUser");
    String userName = (String) session.getAttribute("userName");
    Integer userId = (Integer) session.getAttribute("userId");
    
    if (userObj == null) {
        response.sendRedirect(request.getContextPath() + "/view/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bảng Điều Khiển Người Dùng - Quản Lý Nhà Trọ</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --glass-bg: rgba(255, 255, 255, 0.9);
            --text-main: #2d3436;
            --accent-color: #6c5ce7;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #f8f9fa;
            background-image: radial-gradient(#dfe6e9 1px, transparent 1px);
            background-size: 20px 20px;
            color: var(--text-main);
        }

        /* Navbar Tinh Tế */
        .navbar-custom {
            background: white;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
            padding: 15px 0;
        }

        .brand-logo {
            font-weight: 800;
            font-size: 1.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Profile Header Card */
        .profile-card {
            background: var(--primary-gradient);
            border-radius: 24px;
            padding: 40px;
            color: white;
            margin-top: 30px;
            box-shadow: 0 10px 30px rgba(118, 75, 162, 0.3);
            position: relative;
            overflow: hidden;
        }

        .profile-card::after {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
        }

        .avatar-huge {
            width: 100px;
            height: 100px;
            border-radius: 30px;
            background: white;
            color: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            font-weight: 800;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        /* Stats Cards */
        .stat-card {
            background: white;
            border: none;
            border-radius: 20px;
            padding: 25px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.02);
            height: 100%;
        }

        .stat-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
        }

        .icon-box {
            width: 50px;
            height: 50px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .bg-light-blue { background: #e3f2fd; color: #1976d2; }
        .bg-light-purple { background: #f3e5f5; color: #7b1fa2; }
        .bg-light-green { background: #e8f5e9; color: #2e7d32; }
        .bg-light-orange { background: #fff3e0; color: #ef6c00; }

        .btn-action {
            border-radius: 12px;
            padding: 10px 20px;
            font-weight: 600;
            transition: 0.3s;
        }

        .table-container {
            background: white;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.02);
        }

        .badge-status {
            padding: 8px 15px;
            border-radius: 10px;
            font-weight: 600;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
        <div class="container">
            <a class="navbar-brand brand-logo" href="#">HOME STAY VN</a>
            <div class="d-flex align-items-center">
                <div class="me-3 text-end d-none d-md-block">
                    <div class="fw-bold"><%= userName %></div>
                    <small class="text-muted">Mã: #<%= userId %></small>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm rounded-pill px-3">
                    <i class="fas fa-power-off me-1"></i> Thoát
                </a>
            </div>
        </div>
    </nav>

    <div class="container pb-5">
        <div class="profile-card">
            <div class="row align-items-center">
                <div class="col-md-auto text-center mb-3 mb-md-0">
                    <div class="avatar-huge mx-auto">
                        <%= (userName != null) ? userName.substring(0,1).toUpperCase() : "U" %>
                    </div>
                </div>
                <div class="col-md text-center text-md-start">
                    <h5 class="opacity-75 mb-1">Chào mừng quay trở lại,</h5>
                    <h1 class="fw-800"><%= userName %></h1>
                    <div class="mt-3">
                        <button class="btn btn-light btn-sm btn-action me-2"><i class="fas fa-edit me-1"></i> Hồ sơ</button>
                        <button class="btn btn-glass btn-sm btn-action text-white" style="background: rgba(255,255,255,0.2)"><i class="fas fa-key me-1"></i> Bảo mật</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4 mt-4">
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="icon-box bg-light-blue"><i class="fas fa-door-open"></i></div>
                    <div class="text-muted small fw-bold">PHÒNG THUÊ</div>
                    <h3 class="fw-bold mb-0">03</h3>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="icon-box bg-light-purple"><i class="fas fa-file-signature"></i></div>
                    <div class="text-muted small fw-bold">HỢP ĐỒNG</div>
                    <h3 class="fw-bold mb-0">02</h3>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="icon-box bg-light-green"><i class="fas fa-wallet"></i></div>
                    <div class="text-muted small fw-bold">DƯ NỢ</div>
                    <h3 class="fw-bold mb-0">2.5M</h3>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="stat-card">
                    <div class="icon-box bg-light-orange"><i class="fas fa-bell"></i></div>
                    <div class="text-muted small fw-bold">THÔNG BÁO</div>
                    <h3 class="fw-bold mb-0">05</h3>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-lg-8">
                <div class="table-container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Danh sách phòng đang thuê</h5>
                        <a href="#" class="btn btn-link text-decoration-none">Xem tất cả</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Mã Phòng</th>
                                    <th>Ngày Thuê</th>
                                    <th>Trạng Thái</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="fw-bold">P.402 - Vinhomes</td>
                                    <td>12/01/2026</td>
                                    <td><span class="badge bg-success-subtle text-success badge-status">Đang ở</span></td>
                                    <td><button class="btn btn-light btn-sm rounded-pill"><i class="fas fa-eye text-primary"></i></button></td>
                                </tr>
                                <tr>
                                    <td class="fw-bold">P.101 - Building A</td>
                                    <td>05/02/2026</td>
                                    <td><span class="badge bg-warning-subtle text-warning badge-status">Sắp hết hạn</span></td>
                                    <td><button class="btn btn-light btn-sm rounded-pill"><i class="fas fa-eye text-primary"></i></button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="table-container h-100">
                    <h5 class="fw-bold mb-4">Thanh toán gần đây</h5>
                    <div class="d-flex align-items-start mb-4">
                        <div class="icon-box bg-light-green me-3 mb-0"><i class="fas fa-check"></i></div>
                        <div>
                            <div class="fw-bold">Tiền điện tháng 02</div>
                            <small class="text-muted">Đã thanh toán: 450.000đ</small>
                        </div>
                    </div>
                    <div class="d-flex align-items-start mb-4">
                        <div class="icon-box bg-light-orange me-3 mb-0"><i class="fas fa-clock"></i></div>
                        <div>
                            <div class="fw-bold">Tiền phòng tháng 03</div>
                            <small class="text-danger">Còn nợ: 3.500.000đ</small>
                        </div>
                    </div>
                    <button class="btn btn-primary w-100 btn-action py-3">
                        <i class="fas fa-credit-card me-2"></i> Thanh toán ngay
                    </button>
                </div>
            </div>
        </div>
    </div>

    <footer class="text-center text-muted py-4">
        &copy; 2026 Quản Lý Nhà Trọ VN - Modern Dashboard Design
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>