package dao;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/minitest27_01?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String INSERT_PRODUCTS_SQL = "INSERT INTO products (name, price, quantity, description) VALUES (?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "select id,name,price,quantity,description from products where id = ?";
    private static final String SELECT_ALL_PRODUCTS = "select * from products";
    private static final String DELETE_PRODUCT_SQL = "delete from products where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update products set name = ?, price = ?, quantity = ?, description = ? where id = ?;";

    public ProductDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public List<Product> sortIncreaseByPrice() {
        List<Product> products = selectAllProducts();
        products.sort((o1, o2) -> (int) (o1.getPrice() - o2.getPrice()));
        return products;
    }

    public List<Product> sortDecreaseByPrice() {
        List<Product> products = selectAllProducts();
        products.sort((o1, o2) -> (int) (o2.getPrice() - o1.getPrice()));
        return products;
    }

    public void insertProduct(Product product) throws SQLException {
        System.out.println(INSERT_PRODUCTS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS_SQL)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(3, product.getDescription());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                double price = Double.parseDouble(rs.getString("price"));
                int quantity = Integer.parseInt(rs.getString("quantity"));
                String description = rs.getString("description");
                product = new Product(id, name, price, quantity, description);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = Double.parseDouble(rs.getString("price"));
                int quantity = Integer.parseInt(rs.getString("quantity"));
                String description = rs.getString("description");
                products.add(new Product(id, name, price, quantity, description));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getDescription());
            statement.setInt(5, product.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public Product downQuantity(int id) {
        List<Product> products = selectAllProducts();
        Product productUpdated = null;
        for (Product product : products) {
            if (product.getId() == id) {
                product.setQuantity(product.getQuantity() - 1);
                productUpdated = product;
            }
        }
        return productUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}