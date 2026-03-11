package authen;

import model.Users;
import dal.UserDAO;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate inputs
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập email và mật khẩu.");
            request.setAttribute("email", email);
            RequestDispatcher rs = request.getRequestDispatcher("/view/login.jsp");
            rs.forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        Users account = dao.getUserByEmail(email);

        if (account == null) {
            String error = "Email hoặc mật khẩu không đúng.";
            request.setAttribute("error", error);
            request.setAttribute("email", email);
            RequestDispatcher rs = request.getRequestDispatcher("/view/login.jsp");
            rs.forward(request, response);
            return;
        }

        // Verify password (plain text comparison)
        if (!password.equals(account.getPassword())) {
            String error = "Email hoặc mật khẩu không đúng.";
            request.setAttribute("error", error);
            request.setAttribute("email", email);
            RequestDispatcher rs = request.getRequestDispatcher("/view/login.jsp");
            rs.forward(request, response);
            return;
        }

        // Check if user is active
        if (!account.isActive()) {
            String error = "Tài khoản này đã bị khóa. Vui lòng liên hệ quản trị viên.";
            request.setAttribute("error", error);
            request.setAttribute("email", email);
            RequestDispatcher rs = request.getRequestDispatcher("/view/login.jsp");
            rs.forward(request, response);
            return;
        }

        // Login successful
        HttpSession session = request.getSession();
        session.setAttribute("loggedInUser", account);
        session.setAttribute("userId", account.getUserId());
        session.setAttribute("userRole", account.getRole());
        session.setAttribute("userName", account.getFullName());

        // Redirect based on role
        String role = account.getRole();
        if ("ADMIN".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        } else if ("OWNER".equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/owner/dashboard.jsp");
        } else {
            // Default USER role
            response.sendRedirect(request.getContextPath() + "/view/homePageUser.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to login page
        RequestDispatcher rs = request.getRequestDispatcher("/view/login.jsp");
        rs.forward(request, response);
    }
}