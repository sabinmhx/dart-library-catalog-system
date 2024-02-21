import 'catalog_item.dart';

/// Library catalog to store catalog items
class LibraryCatalog {
  List<CatalogItem> catalog = [];

  void addItem(CatalogItem item) {
    catalog.add(item);
  }

  void removeItem(int uniqueIdentifier) {
    catalog.removeWhere((item) => item.uniqueIdentifier == uniqueIdentifier);
  }

  void displayAllItems() {
    for (var item in catalog) {
      if (item is Book) {
        print(
            "Book Details=> Title: ${item.title}, Author: ${item.authorOrDirector}, Unique Identifier: ${item.uniqueIdentifier}, Genre: ${item.genre}, Publication Date: ${item.publicationDate}, Price: ${item.getPrice()}");
      }
      if (item is Movie) {
        print(
            "Book Details=> Title: ${item.title}, Director: ${item.authorOrDirector}, Unique Identifier: ${item.uniqueIdentifier}, Genre: ${item.genre}, Publication Date: ${item.publicationDate}, Price: ${item.getPrice()}");
      }
    }
  }

  List<CatalogItem> searchItems(String searchTerm) {
    return catalog
        .where((item) =>
            item.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
            item.authorOrDirector
                .toLowerCase()
                .contains(searchTerm.toLowerCase()))
        .toList();
  }
}
