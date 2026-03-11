<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in and has ADMIN role
    Object userObj = session.getAttribute("loggedInUser");
    String userRole = (String) session.getAttribute("userRole");
    String userName = (String) session.getAttribute("userName");
    Integer userId = (Integer) session.getAttribute("userId");
    
    if (userObj == null || userRole == null || !"ADMIN".equalsIgnoreCase(userRole)) {
        response.sendRedirect(request.getContextPath() + "/view/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Admin Dashboard - Quản Lý Nhà Trọ" />
    <title>Admin Dashboard - Quản Lý Nhà Trọ</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            font-family: 'Work Sans', sans-serif;
        }

        :root {
            --primary: #00204a;
            --secondary: #005555;
            --accent: #00a8a8;
            --light-bg: #f5f6f7;
            --border: #e0e4ea;
            --text-primary: #212529;
            --text-secondary: #6c757d;
            --danger: #dc3545;
            --success: #198754;
            --info: #0dcaf0;
            --warning: #ffc107;
        }

        body {
            background: var(--light-bg);
            color: var(--text-primary);
        }

        /* Sidebar Navigation */
        .sidebar {
            background: linear-gradient(180deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            min-height: 100vh;
            padding: 20px 0;
            position: fixed;
            width: 250px;
            left: 0;
            top: 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar-header i {
            font-size: 32px;
            margin-bottom: 10px;
            display: block;
        }

        .sidebar-header h5 {
            font-size: 18px;
            font-weight: 700;
            margin: 0;
            letter-spacing: 0.5px;
        }

        .nav-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-menu li {
            margin: 0;
        }

        .nav-menu a {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }

        .nav-menu a:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-left-color: var(--accent);
            padding-left: 25px;
        }

        .nav-menu a.active {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-left-color: var(--accent);
        }

        .nav-menu i {
            width: 20px;
            margin-right: 15px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 30px;
        }

        /* Top Bar */
        .top-bar {
            background: white;
            padding: 15px 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .top-bar-left h4 {
            font-weight: 700;
            margin: 0;
            color: var(--primary);
        }

        .top-bar-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--secondary), var(--accent));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 18px;
        }

        .user-details span {
            display: block;
            font-size: 12px;
        }

        .user-details .user-name {
            font-weight: 600;
            color: var(--text-primary);
        }

        .user-details .user-role {
            color: var(--text-secondary);
            font-size: 11px;
        }

        .logout-btn {
            background: var(--danger);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 12px;
            font-weight: 600;
        }

        .logout-btn:hover {
            background: darken(#dc3545, 10%);
            transform: translateY(-2px);
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .card-dashboard {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
            border-left: 4px solid transparent;
            transition: all 0.3s ease;
        }

        .card-dashboard:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .card-dashboard.primary {
            border-left-color: var(--primary);
        }

        .card-dashboard.secondary {
            border-left-color: var(--secondary);
        }

        .card-dashboard.success {
            border-left-color: var(--success);
        }

        .card-dashboard.info {
            border-left-color: var(--info);
        }

        .card-dashboard.warning {
            border-left-color: var(--warning);
        }

        .card-dashboard.danger {
            border-left-color: var(--danger);
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .card-dashboard.primary .card-icon {
            background: rgba(0, 32, 74, 0.1);
            color: var(--primary);
        }

        .card-dashboard.secondary .card-icon {
            background: rgba(0, 85, 85, 0.1);
            color: var(--secondary);
        }

        .card-dashboard.success .card-icon {
            background: rgba(25, 135, 84, 0.1);
            color: var(--success);
        }

        .card-dashboard.info .card-icon {
            background: rgba(13, 202, 240, 0.1);
            color: var(--info);
        }

        .card-dashboard.warning .card-icon {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }

        .card-dashboard.danger .card-icon {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }

        .card-title {
            font-size: 14px;
            color: var(--text-secondary);
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
        }

        .card-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 10px;
        }

        .card-description {
            font-size: 12px;
            color: var(--text-secondary);
        }

        /* Content Section */
        .content-section {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title i {
            color: var(--secondary);
            font-size: 22px;
        }

        /* Welcome Section */
        .welcome-section {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 4px 20px rgba(0, 32, 74, 0.2);
        }

        .welcome-section h2 {
            font-size: 28px;
            font-weight: 700;
            margin: 0 0 10px 0;
        }

        .welcome-section p {
            font-size: 15px;
            opacity: 0.95;
            margin: 0;
        }

        /* Table */
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }

        .table {
            margin: 0;
        }

        .table thead th {
            background: var(--light-bg);
            color: var(--text-primary);
            font-weight: 600;
            border: none;
            padding: 15px;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
        }

        .table tbody td {
            padding: 15px;
            border-color: var(--border);
        }

        .table tbody tr:hover {
            background: var(--light-bg);
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            color: var(--text-secondary);
            font-size: 12px;
            margin-top: 40px;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                padding: 20px;
            }

            .dashboard-cards {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
                margin-bottom: 20px;
            }

            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .top-bar {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .top-bar-right {
                flex-direction: column;
                width: 100%;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            .nav-menu a {
                padding: 12px 15px;
            }
        }

        .badge-custom {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-active {
            background: rgba(25, 135, 84, 0.1);
            color: var(--success);
        }

        .badge-inactive {
            background: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-small {
            padding: 6px 12px;
            font-size: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background: var(--info);
            color: white;
        }

        .btn-edit:hover {
            background: #0ab8e6;
        }

        .btn-delete {
            background: var(--danger);
            color: white;
        }

        .btn-delete:hover {
            background: #c82333;
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-header">
            <i class="fas fa-building"></i>
            <h5>Quản Lý Nhà Trọ</h5>
        </div>

        <ul class="nav-menu">
            <li><a href="#dashboard" class="active"><i class="fas fa-chart-pie"></i> Dashboard</a></li>
            <li><a href="#users"><i class="fas fa-users"></i> Quản Lý Users</a></li>
            <li><a href="#rooms"><i class="fas fa-door-open"></i> Quản Lý Phòng</a></li>
            <li><a href="#rentals"><i class="fas fa-file-contract"></i> Quản Lý Thuê</a></li>
            <li><a href="#payments"><i class="fas fa-credit-card"></i> Quản Lý Thanh Toán</a></li>
            <li><a href="#reports"><i class="fas fa-bar-chart"></i> Báo Cáo</a></li>
            <li><a href="#settings"><i class="fas fa-cog"></i> Cài Đặt</a></li>
            <li style="margin-top: 30px; border-top: 1px solid rgba(255, 255, 255, 0.1); padding-top: 20px;">
                <a href="${pageContext.request.contextPath}/logout" style="color: rgba(255, 255, 255, 0.8);">
                    <i class="fas fa-sign-out-alt"></i> Đăng Xuất
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="top-bar-left">
                <h4><i class="fas fa-chart-pie"></i> Dashboard</h4>
            </div>
            <div class="top-bar-right">
                <div class="user-info">
                    <div class="user-avatar"><%= userName != null ? userName.charAt(0) : "A" %></div>
                    <div class="user-details">
                        <span class="user-name"><%= userName != null ? userName : "Admin" %></span>
                        <span class="user-role"><%= userRole %></span>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Đăng Xuất
                </a>
            </div>
        </div>

        <!-- Welcome Section -->
        <div class="welcome-section">
            <h2><i class="fas fa-hands-clapping"></i> Chào mừng, <%= userName != null ? userName : "Admin" %>!</h2>
            <p>Bạn đã đăng nhập với quyền <strong>Admin</strong>. Sử dụng menu bên trái để quản lý hệ thống.</p>
        </div>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <!-- Total Users -->
            <div class="card-dashboard primary">
                <div class="card-icon"><i class="fas fa-users"></i></div>
                <div class="card-title">Tổng Users</div>
                <div class="card-value">1,245</div>
                <div class="card-description">+12 người dùng mới hôm nay</div>
            </div>

            <!-- Total Rooms -->
            <div class="card-dashboard secondary">
                <div class="card-icon"><i class="fas fa-door-open"></i></div>
                <div class="card-title">Tổng Phòng</div>
                <div class="card-value">856</div>
                <div class="card-description">+24 phòng mới tuần này</div>
            </div>

            <!-- Active Rentals -->
            <div class="card-dashboard success">
                <div class="card-icon"><i class="fas fa-file-contract"></i></div>
                <div class="card-title">Hợp Đồng Hoạt Động</div>
                <div class="card-value">632</div>
                <div class="card-description">Đã xác nhận và hoạt động</div>
            </div>

            <!-- Monthly Revenue -->
            <div class="card-dashboard info">
                <div class="card-icon"><i class="fas fa-money-bill-wave"></i></div>
                <div class="card-title">Doanh Thu Tháng</div>
                <div class="card-value">1.2M</div>
                <div class="card-description">Tăng 15% so với tháng trước</div>
            </div>

            <!-- Pending Payments -->
            <div class="card-dashboard warning">
                <div class="card-icon"><i class="fas fa-clock"></i></div>
                <div class="card-title">Thanh Toán Chờ</div>
                <div class="card-value">28</div>
                <div class="card-description">Cần xử lý trong 3 ngày</div>
            </div>

            <!-- System Status -->
            <div class="card-dashboard danger">
                <div class="card-icon"><i class="fas fa-heartbeat"></i></div>
                <div class="card-title">Trạng Thái Hệ Thống</div>
                <div class="card-value" style="color: var(--success); font-size: 24px;"><i class="fas fa-check-circle"></i></div>
                <div class="card-description">Tất cả các dịch vụ hoạt động</div>
            </div>
        </div>

        <!-- Recent Users Section -->
        <div class="content-section">
            <div class="section-title">
                <i class="fas fa-users"></i> Users Gần Đây
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Vai Trò</th>
                            <th>Trạng Thái</th>
                            <th>Ngày Tạo</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nguyễn Văn A</td>
                            <td>nguyenvana@email.com</td>
                            <td><span class="badge bg-primary">ADMIN</span></td>
                            <td><span class="badge-custom badge-active">Hoạt Động</span></td>
                            <td>15/02/2026</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="btn-small btn-delete"><i class="fas fa-trash"></i> Xóa</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Trần Thị B</td>
                            <td>tranthib@email.com</td>
                            <td><span class="badge bg-info">OWNER</span></td>
                            <td><span class="badge-custom badge-active">Hoạt Động</span></td>
                            <td>14/02/2026</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="btn-small btn-delete"><i class="fas fa-trash"></i> Xóa</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Lê Văn C</td>
                            <td>levanc@email.com</td>
                            <td><span class="badge bg-secondary">USER</span></td>
                            <td><span class="badge-custom badge-inactive">Không Hoạt Động</span></td>
                            <td>13/02/2026</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="btn-small btn-delete"><i class="fas fa-trash"></i> Xóa</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Phạm Thị D</td>
                            <td>phamthid@email.com</td>
                            <td><span class="badge bg-info">OWNER</span></td>
                            <td><span class="badge-custom badge-active">Hoạt Động</span></td>
                            <td>12/02/2026</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-small btn-edit"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="btn-small btn-delete"><i class="fas fa-trash"></i> Xóa</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <p>&copy; 2026 Hệ thống Quản Lý Nhà Trọ. Bản quyền thuộc về Admin.</p>
        </footer>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
