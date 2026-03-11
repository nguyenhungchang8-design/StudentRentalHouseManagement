package authen;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Role-Based Access Filter - Protects pages based on user role
 * Roles: ADMIN, OWNER, USER
 */
@WebFilter(filterName = "AuthFilter", urlPatterns = {"/*"})
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String path = requestURI.substring(contextPath.length());
        
        // Public pages - no authentication required
        if (isPublicPage(path)) {
            chain.doFilter(request, response);
            return;
        }
        
        // Check authentication
        if (session == null || session.getAttribute("loggedInUser") == null) {
            // Not logged in - redirect to login
            httpResponse.sendRedirect(contextPath + "/view/login.jsp");
            return;
        }
        
        // Get user role
        String userRole = (String) session.getAttribute("userRole");
        
        // Check authorization based on role
        if (!isAuthorized(path, userRole)) {
            // Not authorized - redirect to access denied page
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập trang này");
            return;
        }
        
        // Pass to next filter/servlet
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
    
    /**
     * Check if page is public (no authentication required)
     */
    private boolean isPublicPage(String path) {
        return path.startsWith("/view/login.jsp") ||
               path.startsWith("/index.html") ||
               path.startsWith("/css/") ||
               path.startsWith("/js/") ||
               path.startsWith("/images/") ||
               path.startsWith("/fonts/") ||
               path.equals("/") ||
               path.startsWith("/login") ||
               path.startsWith("/view/register");
    }
    
    /**
     * Check if user with given role is authorized to access path
     */
    private boolean isAuthorized(String path, String role) {
        if (role == null) {
            return false;
        }
        
        // ADMIN paths - only ADMIN role
        if (path.startsWith("/admin/")) {
            return "ADMIN".equalsIgnoreCase(role);
        }
        
        // OWNER paths - only OWNER role
        if (path.startsWith("/owner/")) {
            return "OWNER".equalsIgnoreCase(role);
        }
        
        // USER paths - all authenticated users
        if (path.startsWith("/view/") || path.startsWith("/user/")) {
            return "USER".equalsIgnoreCase(role) || 
                   "OWNER".equalsIgnoreCase(role) || 
                   "ADMIN".equalsIgnoreCase(role);
        }
        
        // Default allow for authenticated users
        return true;
    }
}
