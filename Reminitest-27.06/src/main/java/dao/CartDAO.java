package dao;

import model.Cart;
import model.Product;

import java.util.ArrayList;

public class CartDAO {
    private final static ArrayList<Cart> carts = new ArrayList<>();

    public ArrayList<Cart> getCarts() {
        return carts;
    }

    public void AddProductToCart(Product product) {
        boolean check = false;
        for (Cart cart : carts) {
            if (cart.getProduct().getId() == product.getId()) {
                cart.setQuantity(cart.getQuantity() + 1);
                check = true;
            }
        }
        if (!check) {
            Cart cart = new Cart(product, 1);
            carts.add(cart);
        }
    }

    public void deleteCartById(int id) {
        Cart cartDel =  null;
        for (Cart cart : carts) {
            if (cart.getProduct().getId() == id) {
                cartDel = cart;
            }
        }
        if (cartDel != null) {
            carts.remove(cartDel);
        }
    }

    public Double payMoney() {
        double sum = 0;
        for (Cart cart : carts) {
            sum += cart.getProduct().getPrice() * cart.getQuantity();
        }
        carts.clear();
        return sum;
    }
}
