import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float discount = Float.parseFloat(request.getParameter("discount"));
        String product = request.getParameter("product");
        float amount = (float) (price * discount * 0.01);

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product: " + product + "</h1>");
        writer.println("<h1>List Price: " + price + "</h1>");
        writer.println("<h1>Discount: " + discount + "</h1>");
        writer.println("<h1>Discount Amount: " + amount + "</h1>");
        writer.println("<h1>Discount Price: " + (price - amount)  + "</h1>");
        writer.println("</html>");
    }
}
