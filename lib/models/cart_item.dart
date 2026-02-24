class CartItem {
  final String name;
  final double price;
  final String imagePath;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });

  // Para copiar con nueva cantidad (útil si luego implementas + / -)
  CartItem copyWith({int? quantity}) {
    return CartItem(
      name: name,
      price: price,
      imagePath: imagePath,
      quantity: quantity ?? this.quantity,
    );
  }
}