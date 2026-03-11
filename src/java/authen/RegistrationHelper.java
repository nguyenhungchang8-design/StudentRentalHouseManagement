package authen;

import dal.UserDAO;
import model.Users;

/**
 * Helper class for user registration
 * Supports roles: ADMIN, OWNER, USER
 */
public class RegistrationHelper {

    /**
     * Register a new user with email and password (plain text)
     * 
     * @param email User's email
     * @param password Plain text password (stored as-is)
     * @param fullName User's full name
     * @param phone User's phone number
     * @param role User's role (USER, OWNER, ADMIN)
     * @return true if registration successful, false otherwise
     */
    public static boolean registerUser(String email, String password, String fullName, 
                                       String phone, String role) {
        
        // Validate inputs
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        if (password == null || password.length() < 3) {
            return false;
        }
        if (fullName == null || fullName.trim().isEmpty()) {
            return false;
        }

        // Check if email already exists
        UserDAO dao = new UserDAO();
        if (dao.getUserByEmail(email) != null) {
            return false; // Email already exists
        }

        // Create new user
        Users newUser = new Users();
        newUser.setEmail(email.trim());
        newUser.setPassword(password); // Store plain text
        newUser.setFullName(fullName.trim());
        newUser.setPhone(phone != null ? phone.trim() : null);
        newUser.setRole(role != null ? role : "USER");
        newUser.setActive(true);

        // Save to database
        return dao.createUser(newUser);
    }

    /**
     * Register with specific role
     */
    public static boolean registerAdmin(String email, String password, String fullName, String phone) {
        return registerUser(email, password, fullName, phone, "ADMIN");
    }

    public static boolean registerOwner(String email, String password, String fullName, String phone) {
        return registerUser(email, password, fullName, phone, "OWNER");
    }

    public static boolean registerUserAccount(String email, String password, String fullName, String phone) {
        return registerUser(email, password, fullName, phone, "USER");
    }

    /**
     * Validate email format
     */
    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }

    /**
     * Check if password has minimum length
     */
    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 3;
    }
}
