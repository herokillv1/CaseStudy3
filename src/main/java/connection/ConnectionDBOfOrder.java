package connection;

import model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConnectionDBOfOrder implements ConnectionDBOrder {
    private static final String INSERT_ORDER_SQL = "INSERT INTO cart(id_product_buy, name_product_buy, price_product_buy," +
            "description_product_buy, iamge_product_buy, amount_product_buy) VALUES (?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_ORDER_SQL = "UPDATE cart SET amount_product_buy = ? WHERE id_product_buy = ?";
    private static final String DELETE_ORDER_SQL = "DELETE FROM cart WHERE id_product_buy > ?;";
    private static final String SELECT_ALL_ORDER_SQL = "SELECT * FROM cart;";
    private static final String TOTAL_PRICE_ORD  = "SELECT sum(amount_product_buy*price_product_buy) as total " +
            "from cart where id_product_buy > 0;";
    private static final Connection connection = new ConnectionDBOfCustomer().getConnection();


    @Override
    public void insertOrder(Order order) {
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL)) {
            preparedStatement.setInt(1, order.getIdbuy());
            preparedStatement.setString(2, order.getNamebuy());
            preparedStatement.setLong(3, order.getPricebuy());
            preparedStatement.setString(4, order.getDescriptionbuy());
            preparedStatement.setString(5, order.getImagebuy());
            preparedStatement.setInt(6, order.getAmountbuy());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean updateOrder(Order order, int amountbuy) {
        boolean rowUpdated = false;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER_SQL)) {
            preparedStatement.setInt(1, amountbuy);
            preparedStatement.setInt(2, order.getIdbuy());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public boolean deleteOrder() throws SQLException {
        boolean rowDeleted = false;
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_SQL)) {
            preparedStatement.setInt(1, 0);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public List<Order> selectAllOrder() {
        List<Order> orders = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDER_SQL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idbuy = rs.getInt("id_product_buy");
                String namebuy = rs.getString("name_product_buy");
                long pricebuy = rs.getLong("price_product_buy");
                String descriptionbuy = rs.getString("description_product_buy");
                int amountbuy = rs.getInt("amount_product_buy");
                String imagebuy = rs.getString("iamge_product_buy");
                orders.add(new Order(idbuy, namebuy, pricebuy, descriptionbuy, imagebuy, amountbuy));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public int totalPrice() throws SQLException {
        int total = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TOTAL_PRICE_ORD);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int totalprice = rs.getInt("total");
                total += totalprice;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }
}
