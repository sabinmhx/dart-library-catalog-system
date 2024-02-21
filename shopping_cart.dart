import 'catalog_item.dart';
import 'discount_coupon.dart';
import 'user.dart';

/// ShoppingCart class for user to add items in cart
class ShoppingCart implements Purchasable {
  User user;
  List<Purchasable> items = [];
  DiscountCoupon? appliedDiscount;
  ShoppingCart(this.user);

  void addItem(Purchasable item) {
    items.add(item);
  }

  void removeItem(Purchasable item) {
    items.remove(item);
  }

  void applyDiscount(DiscountCoupon discount) {
    appliedDiscount = discount;
  }

  @override
  double getPrice() {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.getPrice();
    }

    // Apply discount in the shopping cart
    if (appliedDiscount != null) {
      totalPrice *= (100 - appliedDiscount!.percentage) / 100;
    }

    return totalPrice;
  }

  // Display items present in the shopping cart
  void displayItems() {
    print("Items in the Shopping Cart for ${user.username}");
    for (var item in items) {
      if (item is CatalogItem) {
        print("Title: ${item.title}, Price: ${item.getPrice()}");
      }
    }
  }
}
