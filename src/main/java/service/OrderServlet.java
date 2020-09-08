package service;

import connection.ConnectionDBOfOrder;
import connection.ConnectionDBOfProduct;
import connection.ConnectionDBOrder;
import model.Order;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "OrderServlet", urlPatterns = "/order")
public class OrderServlet extends HttpServlet {
    ConnectionDBOrder connectionDBOrder = new ConnectionDBOfOrder();
    ConnectionDBOfProduct connectionDBOfProduct = new ConnectionDBOfProduct();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addInCart(request, response);
                break;
            case "delete":
                deleteCart(request, response);
            default:
                cartPresent(request, response);
                break;
        }
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        if (connectionDBOrder.deleteOrder()) {
            List<Order> orders = connectionDBOrder.selectAllOrder();
            request.setAttribute("listOrder", orders);
            String message = "Hiện không có sản phẩm nào!";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/cart_of_customer.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void addInCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = connectionDBOfProduct.selectProductById(id);
        String namebuy = product.getName();
        long pricebuy = product.getPrice();
        String descriptionbuy = product.getDescription();
        String imagebuy = product.getImageUrl();
        int amountbuy = Integer.parseInt(request.getParameter("amount"));
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        Order order = new Order(id, namebuy, pricebuy, descriptionbuy, imagebuy, amountbuy);
        connectionDBOrder.insertOrder(order);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer");
        dispatcher.forward(request, response);
    }

    private void cartPresent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        List<Order> orders = connectionDBOrder.selectAllOrder();
        request.setAttribute("listOrder", orders);
        int totalPrice = connectionDBOrder.totalPrice();
        request.setAttribute("totalPrice", totalPrice);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/cart_of_customer.jsp");
        dispatcher.forward(request, response);
    }
}
