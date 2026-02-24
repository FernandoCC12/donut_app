import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/cart.dart';

class PancakeTile extends StatelessWidget {
  final String pancakeFlavor;
  final String pancakePrice;
  final dynamic pancakeColor;
  final String pancakeImagePath;
  final String pancakeProvider;

  const PancakeTile({
    super.key,
    required this.pancakeFlavor,
    required this.pancakePrice,
    required this.pancakeColor,
    required this.pancakeImagePath,
    required this.pancakeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pancakeColor[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Etiqueta del precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: pancakeColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$pancakePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pancakeColor[800],
                    ),
                  ),
                ),
              ],
            ),
            // Imagen
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(pancakeImagePath),
            ),
            // Nombre
            Text(
              pancakeFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 4),
            // Proveedor
            Text(
              pancakeProvider,
              style: TextStyle(color: Colors.grey[600]),
            ),
            // Icono de favorito y botón Add
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border, color: Colors.pink[400], size: 11),
                  GestureDetector(
                    onTap: () {
                      // Obtener el carrito (sin escuchar)
                      final cart = Provider.of<Cart>(context, listen: false);
                      // Crear el ítem con los datos del pancake
                      final item = CartItem(
                        name: pancakeFlavor,
                        price: double.parse(pancakePrice),
                        imagePath: pancakeImagePath,
                      );
                      cart.addItem(item);
                      // Feedback visual
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${pancakeFlavor} agregado al carrito'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}