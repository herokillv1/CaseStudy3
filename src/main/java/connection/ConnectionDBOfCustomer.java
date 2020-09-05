package connection;

import model.Customer;

import java.sql.*;
import java.util.List;

public class ConnectionDBOfCustomer implements ConnectionDBCustomer {

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer(name_customer, age_customer, render_customer, "
            + "email_customer, address_customer, phone_customer, account_customer, password_customer, dateCreate) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ACCOUNT_SQL = "SELECT * FROM customer WHERE account_customer = ?";

    public ConnectionDBOfCustomer() {
    }

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/casestudy3?useSSL=false";
            String jdbcUsername = "root";
            String jdbcPassword = "123456";
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    private void setValueOfCustomer(Customer customer, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setString(1, customer.getName());
        preparedStatement.setInt(2, customer.getAge());
        preparedStatement.setString(3, customer.getRender());
        preparedStatement.setString(4, customer.getEmail());
        preparedStatement.setString(5, customer.getAddress());
        preparedStatement.setString(6, customer.getPhone());
        preparedStatement.setString(7, customer.getAccount());
        preparedStatement.setString(8, customer.getPassword());
        preparedStatement.setDate(9, (Date) customer.getDateCreate());
    }

    @Override
    public void insertCustomer(Customer customer) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            setValueOfCustomer(customer, preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return false;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return null;
    }

    @Override
    public Customer selectCustomerByName(String account) {
        Customer customer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_SQL)) {
            preparedStatement.setString(1, account);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name_customer");
                int age = rs.getInt("age_customer");
                String render = rs.getString("render_customer");
                String email = rs.getString("email_customer");
                String address = rs.getString("address_customer");
                String phone = rs.getString("phone_customer");
                String accountCus = rs.getString("account_customer");
                String password = rs.getString("password_customer");
                Date dateCreate = rs.getDate("dateCreate");
                customer = new Customer(name, age, render, email, address, phone, accountCus, password, dateCreate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }


}
