import 'catalog_item.dart';
import 'order.dart';
import 'inventory.dart';
import 'shopping_cart.dart';
import 'discount_coupon.dart';

/// User class
class User {
  late String username;
  late String password;
  late String email;

  List<Order> purchaseHistory = [];

  User(this.username, this.password, this.email);

  register() {
    this.username = username;
    this.password = password;
    this.email = email;
    print("You are successfully registered as: ${this.username}");
  }

  authenticate(String entererdUsername, enteredPassword) {
    if (username == entererdUsername && password == enteredPassword) {
      print("Successful Authentication");
    } else {
      print("Wrong password entered");
    }
  }

  void displayPurchaseHistory() {
    print("Purchase History:");
    for (var order in purchaseHistory) {
      print("Order Date: ${order.orderDate}");
      print("Total Price: ${order.totalPrice}");
      for (var item in order.items) {
        if (item is CatalogItem) {
          print("Title: ${item.title}");
          print("Price: ${item.getPrice()}");
        }
      }
      if (order.appliedDiscount != null) {
        print("Discount Applied: ${order.appliedDiscount!.code}");
      }
    }
  }
}

void main() {
  User user = User("sabin", "sabin123", "sabin@gmail.com");
  user.register();
  user.authenticate("sabin", "sabin123");

  Book book1 =
      Book("Book1", "Author1", "Genre1", DateTime(2000, 1, 1), 1.0, 100);
  Movie movie1 =
      Movie("Movie1", "Director1", "Genre1", DateTime(2000, 1, 1), 1.0, 300);
  Inventory inventory = Inventory();
  inventory.addItem(book1);
  inventory.addItem(movie1);

  inventory.displayAllItems();

  ShoppingCart cart = ShoppingCart(user);
  cart.addItem(book1);
  cart.addItem(movie1);

  // Apply discount to the shopping cart
  DiscountCoupon discount =
      DiscountCoupon("discount1", 10, DateTime(2024, 1, 1));
  cart.applyDiscount(discount);

  // Display items in the shopping cart
  cart.displayItems();

  double totalPrice = cart.getPrice();
  print("Total Price in the Shopping Cart: ${totalPrice}");

  // Create an order from the shopping cart
  Order order = Order(cart.items, discount);
  order.processOrder(inventory, user);

  // Add the order to the user's purchase history
  user.purchaseHistory.add(order);
  user.displayPurchaseHistory();

  book1.addReview(user, 5, "Great Book");
  book1.displayReviews();
}
