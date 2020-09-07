package connection;

import model.Customer;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ConnectionDBCustomer {
    void insertCustomer(Customer customer) throws SQLException;

    boolean updateCustomer(Customer customer) throws SQLException;

    boolean updatePasswordCustomer(String account, String newpassword) throws SQLException;

    boolean deleteCustomer(int id) throws SQLException;

    List<Customer> selectAllCustomer();

    Customer selectCustomerByName(String account);

    boolean addInCart(Product product);
}