package dal;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            Properties properties = new Properties();

            // Load properties từ classpath thay vì file path
            InputStream inputStream = DBContext.class.getClassLoader()
                    .getResourceAsStream("ConnectDB.properties");

            if (inputStream == null) {
                throw new RuntimeException("File ConnectDB.properties không tìm thấy!");
            }

            properties.load(inputStream);

            String user = properties.getProperty("userID");
            String pass = properties.getProperty("password");
            String url = properties.getProperty("url");

            if (user == null || pass == null || url == null) {
                throw new RuntimeException("Thiếu cấu hình trong ConnectDB.properties!");
            }

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi kết nối database: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        DBContext db = new DBContext();

        if (db.connection != null) {
            System.out.println("✅ Kết nối Database thành công!");
        } else {
            System.out.println("❌ Không thể kết nối Database!");
        }
    }
}