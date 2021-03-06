package controller;

import connection.ConnectionDBOfCustomer;
import connection.ConnectionDBOfProduct;
import model.Customer;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControlServlet", urlPatterns = "/control")
public class ControlServlet extends HttpServlet {
    ConnectionDBOfProduct connectionDBOfProduct = new ConnectionDBOfProduct();
    ConnectionDBOfCustomer connectionDBOfCustomer = new ConnectionDBOfCustomer();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "editProduct":
                editProduct(request, response);
                break;
            case "createProduct":
                createProduct(request, response);
                break;
            case "rePassword":
                rePassword(request, response);
                break;
            case "updateCustomer":
                updateCustomer(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if ("deleteProduct".equals(action)) {
            deleteProduct(request, response);
        }
    }


    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("customer-name");
        int age = Integer.parseInt(request.getParameter("customer-age"));
        String render = request.getParameter("customer-render");
        String email = request.getParameter("customer-email");
        String address = request.getParameter("customer-address");
        String phone = request.getParameter("customer-phone");
        String account = request.getParameter("account");
        Customer customer = new Customer(name, age, render, email, address, phone, account);
        if (connectionDBOfCustomer.updateCustomer(customer)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer?action=updatecustomer");
            dispatcher.forward(request, response);
        }
    }

    private void rePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("customer-account");
        String newPassword = request.getParameter("customer-renew-pass");
        if (connectionDBOfCustomer.updatePasswordCustomer(account, newPassword)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer?action=alert");
            dispatcher.forward(request, response);
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int code = Integer.parseInt(request.getParameter("product-code"));
        String name = request.getParameter("product-name");
        String type = request.getParameter("product-type");
        long price = Long.parseLong(request.getParameter("product-price"));
        String description = request.getParameter("product-description");
        String imageUrl = request.getParameter("product-imageUrl");
        int amount = Integer.parseInt(request.getParameter("product-amount"));
        Product product = new Product(id, code, name, type, price, description, imageUrl, amount);
        if (connectionDBOfProduct.updateProduct(product)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin");
            dispatcher.forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (connectionDBOfProduct.deleteProduct(id)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin");
            dispatcher.forward(request, response);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int code = Integer.parseInt(request.getParameter("product-code"));
        String name = request.getParameter("product-name");
        String type = request.getParameter("product-type");
        long price = Long.parseLong(request.getParameter("product-price"));
        String description = request.getParameter("product-description");
        String imageUrl = request.getParameter("product-imageUrl");
        int amount = Integer.parseInt(request.getParameter("product-amount"));
        Product product = new Product(code, name, type, price, description, imageUrl, amount);
        connectionDBOfProduct.insertProduct(product);
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin");
        dispatcher.forward(request, response);

    }
}