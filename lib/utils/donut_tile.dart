import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/cart.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String donutImagePath;
  final String donutProvider;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.donutImagePath,
    required this.donutProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Etiqueta de precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: donutColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$donutPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: donutColor[800],
                    ),
                  ),
                ),
              ],
            ),
            // Imagen del donut
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(donutImagePath),
            ),
            // Nombre del donut
            Text(
              donutFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            // Proveedor del donut
            Text(
              donutProvider,
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
                      // Crear el item con los datos de esta dona
                      final item = CartItem(
                        name: donutFlavor,
                        price: double.parse(donutPrice),
                        imagePath: donutImagePath,
                      );
                      cart.addItem(item);
                      // Feedback visual
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${donutFlavor} agregado al carrito'),
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