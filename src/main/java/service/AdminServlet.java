package service;

import connection.ConnectionDBOfProduct;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    ConnectionDBOfProduct connectionDBOfProduct = new ConnectionDBOfProduct();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if ("search".equals(action)) {
            listSearch(request, response);
        } else {
            listAllProduct(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "shirt":
                listShirt(request, response);
                break;
            case "trousers":
                listTrousers(request, response);
                break;
            case "shoes":
                listShoes(request, response);
                break;
            case "delete":
                deleleProductById(request,response);
                break;
            case "edit":
                editProductById(request,response);
                break;
            default:
                listAllProduct(request, response);
                break;
        }
    }

    private void listShirt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        String type = request.getParameter("type");
        List<Product> products = connectionDBOfProduct.selectProductOfShirt(type);
        request.setAttribute("listAllProduct", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
        dispatcher.forward(request, response);
    }

    private void listTrousers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        String type = request.getParameter("type");
        List<Product> products = connectionDBOfProduct.selectProductOfTrousers(type);
        request.setAttribute("listAllProduct", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
        dispatcher.forward(request, response);
    }

    private void listShoes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        String type = request.getParameter("type");
        List<Product> products = connectionDBOfProduct.selectProductOfShoes(type);
        request.setAttribute("listAllProduct", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
        dispatcher.forward(request, response);
    }

    private void listSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        String regex = request.getParameter("regex");
        List<Product> products = connectionDBOfProduct.selectProductByName(regex);
        if (products.size() > 0){
            request.setAttribute("listAllProduct", products);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
            dispatcher.forward(request, response);
        }else {
            request.setAttribute("mess","");
            request.setAttribute("listAllProduct", products);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void deleleProductById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String controller = "deleteModal";
        request.setAttribute("controller", controller);
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = connectionDBOfProduct.selectProductById(id);
        request.setAttribute("product", product);
        List<Product> products = connectionDBOfProduct.selectAllProduct();
        request.setAttribute("listAllProduct", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
        dispatcher.forward(request, response);
    }

    private void editProductById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String controller = "editModal";
        request.setAttribute("controller", controller);
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = connectionDBOfProduct.selectProductById(id);
        request.setAttribute("product", product);
        List<Product> products = connectionDBOfProduct.selectAllProduct();
        request.setAttribute("listAllProduct", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
        dispatcher.forward(request, response);
    }

    private void listAllProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        request.setAttribute("account", account);
        List<Product> products = connectionDBOfProduct.selectAllProduct();
        request.setAttribute("listAllProduct", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/home_admin.jsp");
        dispatcher.forward(request, response);
    }
}
