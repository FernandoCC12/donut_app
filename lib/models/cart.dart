import 'package:flutter/material.dart';
import 'cart_item.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(CartItem newItem) {
    // Buscar si ya existe un item con el mismo nombre
    final existingIndex = _items.indexWhere((item) => item.name == newItem.name);
    if (existingIndex >= 0) {
      // Si existe, aumentar cantidad
      _items[existingIndex].quantity++;
    } else {
      // Si no, agregar nuevo
      _items.add(newItem);
    }
    notifyListeners();
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item.name == name);
    notifyListeners();
  }

  void incrementQuantity(String name) {
    final index = _items.indexWhere((item) => item.name == name);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String name) {
    final index = _items.indexWhere((item) => item.name == name);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}