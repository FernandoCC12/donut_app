import 'package:flutter/material.dart';
import 'cart_item.dart';

// Un carrito mucho más simple y directo
class Cart extends ChangeNotifier {
  // Lista de productos
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  // Cálculos automáticos y directos
  double get subtotal => _items.fold(0, (suma, item) => suma + (item.price * item.quantity));
  
  // IVA del 16% sobre el subtotal
  double get iva => subtotal * 0.16;
  
  // Costo fijo de envío, solo si hay algo en el carrito
  double get costoEnvio => _items.isEmpty ? 0 : 150.0;
  
  // Total a pagar
  double get totalFinal => subtotal + iva + costoEnvio;
  
  int get totalArticulos => _items.fold(0, (suma, item) => suma + item.quantity);

  // --- MÉTODOS SIMPLES ---

  // Agregar un producto (si ya existe, solo suma 1)
  void agregar(CartItem nuevoItem) {
    var existente = _items.where((i) => i.name == nuevoItem.name).firstOrNull;
    if (existente != null) {
      existente.quantity++;
    } else {
      _items.add(nuevoItem);
    }
    notifyListeners();
  }

  // Sumar 1 a un producto que ya tenemos referenciado
  void sumar(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  // Restar 1 (y si llega a 0, lo elimina directamente)
  void restar(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  // Eliminar el producto completo sin importar la cantidad
  void eliminar(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Vaciar todo el carrito (para cuando la compra sea exitosa)
  void vaciar() {
    _items.clear();
    notifyListeners();
  }
}