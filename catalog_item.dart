import 'dart:math';
import 'review.dart';
import 'user.dart';

/// Base class for catalog items
class CatalogItem implements Purchasable {
  late String title;
  late String authorOrDirector;
  late int uniqueIdentifier;
  late String genre;
  late DateTime publicationDate;
  double price;
  List<Review> reviews = [];

  CatalogItem(
    this.title,
    this.authorOrDirector,
    this.genre,
    this.publicationDate,
    this.price,
  ) {
    this.uniqueIdentifier = _generateUniqueIdentifier();
  }

  int _generateUniqueIdentifier() {
    return Random().nextInt(9999);
  }

  @override
  double getPrice() {
    return price;
  }

  void addReview(User user, int rating, String comment) {
    Review review = Review(user.username, rating, comment);
    reviews.add(review);
    print("$title received a review from ${user.username}.");
  }

  void displayReviews() {
    if (reviews.isNotEmpty) {
      print("Reviews:");
      for (var review in reviews) {
        print(
            "Rating: ${review.rating}, Comment: ${review.comment}, By: ${review.user}");
      }
    } else {
      print("No reviews available for $title.");
    }
  }
}

/// Subclass for books
class Book extends CatalogItem {
  late int numberOfPages;
  Book(String title, String author, String genre, DateTime publicationDate,
      double price, int numberOfPages)
      : super(title, author, genre, publicationDate, price) {
    this.numberOfPages = numberOfPages;
  }
}

/// Subclass for movies
class Movie extends CatalogItem {
  late int duration;
  Movie(String title, String director, String genre, DateTime publicationDate,
      double price, int duration)
      : super(title, director, genre, publicationDate, price) {
    this.duration = duration;
  }
}

/// Purchasable interface
abstract class Purchasable {
  double getPrice();
}
