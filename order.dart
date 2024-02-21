import 'catalog_item.dart';
import 'discount_coupon.dart';
import 'inventory.dart';
import 'user.dart';

/// Order class to order the items presenet in cart
class Order {
  List<Purchasable> items = [];
  late double totalPrice;
  late DateTime orderDate;
  DiscountCoupon? appliedDiscount;

  Order(this.items, this.appliedDiscount) {
    this.orderDate = DateTime.now();
    this.totalPrice = _calculateTotalPrice();
  }

  double _calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.getPrice();
    }

    // Apply discount in the order
    if (appliedDiscount != null) {
      totalPrice *= (100 - appliedDiscount!.percentage) / 100;
    }

    return totalPrice;
  }

  void processOrder(Inventory inventory, User user) {
    // Deduct items from inventory
    for (var item in items) {
      if (item is CatalogItem) {
        inventory.removeItem(item.uniqueIdentifier);
      }
    }
    print("User is: ${user.username}");
    print("Order processed successfully!");
    print("-------------------");
  }
}
