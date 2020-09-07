package connection;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface ConnectionDBProduct {
    void insertProduct(Product product) throws SQLException;

    boolean updateProduct(Product product) throws SQLException;

    boolean deleteProduct(int id) throws SQLException;

    List<Product> selectProductByName(String name);

    Product selectProductByCode(int id);

    Product selectProductById(int id);

    List<Product> selectAllProduct();

    List<Product> selectProductOfShirt(String type);

    List<Product> selectProductOfTrousers(String type);

    List<Product> selectProductOfShoes(String type);

}
