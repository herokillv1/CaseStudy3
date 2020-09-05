package connection;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ConnectionDBCustomer {
    void insertCustomer(Customer customer) throws SQLException;

//    boolean updateCustomer(Customer customer) throws SQLException;
//
//    boolean deleteCustomer(int id) throws SQLException;

    List<Customer> selectAllCustomer();

    Customer selectCustomerByName(String account);
}
