import '../models/product.dart';
import '../models/cart_item.dart';

class ApiService {
  static final List<Product> _products = [];
  static final List<CartItem> _cart = [];

  // Produk
  static void addProduct(Product product) => _products.add(product);
  static List<Product> getProducts() => _products;
  static void deleteProduct(int index) => _products.removeAt(index);

  // Keranjang
  static void addToCart(Product product) {
    final existing = _cart.indexWhere(
      (item) => item.product.name == product.name,
    );
    if (existing != -1) {
      _cart[existing].quantity++;
    } else {
      _cart.add(CartItem(product: product));
    }
  }

  static List<CartItem> getCartItems() => _cart;
  static void removeFromCart(int index) => _cart.removeAt(index);
}
