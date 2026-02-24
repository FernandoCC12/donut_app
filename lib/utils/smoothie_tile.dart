import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/cart.dart';

class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String smoothieImagePath;
  final String smoothieProvider;

  const SmoothieTile({
    super.key,
    required this.smoothieFlavor,
    required this.smoothiePrice,
    required this.smoothieColor,
    required this.smoothieImagePath,
    required this.smoothieProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: smoothieColor[100],
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
                    color: smoothieColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$smoothiePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: smoothieColor[800],
                    ),
                  ),
                ),
              ],
            ),
            // Imagen
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(smoothieImagePath),
            ),
            // Nombre
            Text(
              smoothieFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 4),
            // Proveedor
            Text(
              smoothieProvider,
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
                      // Crear el ítem con los datos de este smoothie
                      final item = CartItem(
                        name: smoothieFlavor,
                        price: double.parse(smoothiePrice),
                        imagePath: smoothieImagePath,
                      );
                      cart.addItem(item);
                      // Feedback visual
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${smoothieFlavor} agregado al carrito'),
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