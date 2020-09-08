package connection;

import model.Order;

import java.sql.SQLException;
import java.util.List;

public interface ConnectionDBOrder {
    void insertOrder(Order order) throws SQLException;

    boolean updateOrder(Order order, int amountbuy) throws SQLException;

    boolean deleteOrder() throws SQLException;

    List<Order> selectAllOrder();

    int totalPrice() throws SQLException;
}
