package service;

import model.Product;

import java.util.ArrayList;

public class ProductService {
    private static final ArrayList<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1, "Iphone X", 10000, 10, "Like New"));
        products.add(new Product(2, "Apple Watch 5", 5000, 5, "New"));
        products.add(new Product(3, "Mac", 20000, 8, "Old"));
    }

    public Product getProduct(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public void createProduct(Product product) {
        products.add(product);
    }

    public void deleteProduct(Product product) {
        products.remove(product);
    }

    public void editProduct(int index, Product product) {
        products.set(index, product);
    }

    public ArrayList<Product> displayAll() {
        return products;
    }

    public ArrayList<Product> sortIncrease() {
        products.sort((o1, o2) -> (int) (o1.getPrice() - o2.getPrice()));
        return products;
    }

    public ArrayList<Product> sortDecrease() {
        products.sort((o1, o2) -> (int) (o2.getPrice() - o1.getPrice()));
        return products;
    }
}
