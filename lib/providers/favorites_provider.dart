// lib/providers/favorites_provider.dart
import 'package:flutter/material.dart';
import '../models/book_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Book> _favorites = [];

  FavoritesProvider(String uid);

  List<Book> get favorites => _favorites;

  void addBook(Book book) {
    if (!_favorites.contains(book)) {
      _favorites.add(book);
      notifyListeners();
    }
  }

  void removeBook(Book book) {
    _favorites.remove(book);
    notifyListeners();
  }

  bool isFavorite(Book book) {
    return _favorites.any((element) => element.title == book.title);
  }
}
