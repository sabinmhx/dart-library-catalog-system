import 'catalog_item.dart';
import 'library_catalog.dart';

/// Inventory which extends library catalog to store items
class Inventory extends LibraryCatalog {
  @override
  void addItem(CatalogItem item) {
    super.addItem(item);
  }

  @override
  void removeItem(int uniqueIdentifier) {
    super.removeItem(uniqueIdentifier);
  }

  @override
  void displayAllItems() {
    super.displayAllItems();
  }

  @override
  List<CatalogItem> searchItems(String searchTerm) {
    return super.searchItems(searchTerm);
  }
}
