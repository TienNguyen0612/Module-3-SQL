package controller;

import dao.CartDAO;
import dao.ProductDAO;
import model.Cart;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ControlServlet", urlPatterns = "/home")
public class ControlServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();
    private final CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            action(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "detail":
                displayDetail(request, response);
                break;
            case "createGet":
                createGet(request, response);
                break;
            case "createPost":
                createPost(request, response);
                break;
            case "editGet":
                editGet(request, response);
                break;
            case "editPost":
                editPost(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "sortIncrease":
                sortIncreaseByPrice(request, response);
                break;
            case "sortDecrease":
                sortDecreaseByPrice(request, response);
                break;
            case "addToCart":
                addToCart(request, response);
                break;
            case "deleteCart":
                deleteCart(request, response);
                break;
            case "cart":
                displayAllCarts(request, response);
                break;
            case "pay":
                payMoney(request, response);
                break;
            default:
                displayAllProducts(request, response);
                break;
        }
    }

    private void payMoney(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double bill = cartDAO.payMoney();
        request.setAttribute("bill", bill);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAllCarts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> carts = cartDAO.getCarts();
        request.setAttribute("carts", carts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartDAO.deleteCartById(id);
        displayAllCarts(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.selectProduct(id);
        Product productUpdated = productDAO.downQuantity(id);
        cartDAO.AddProductToCart(product);
        productDAO.updateProduct(productUpdated);
        displayAllProducts(request, response);
    }

    private void sortDecreaseByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productDAO.sortDecreaseByPrice();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void sortIncreaseByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productDAO.sortIncreaseByPrice();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAllProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productDAO.selectAllProducts();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(id);
        List<Product> products = productDAO.selectAllProducts();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Product product = new Product(id, name, price, quantity, description);

        productDAO.updateProduct(product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.selectProduct(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Product product = new Product(name, price, quantity, description);
        productDAO.insertProduct(product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("create.jsp");
    }

    private void displayDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.selectProduct(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view-detail.jsp");
        requestDispatcher.forward(request, response);
    }
}
