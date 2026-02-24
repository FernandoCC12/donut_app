import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/cart.dart';

class BurgerTile extends StatelessWidget {
  final String burgerFlavor;
  final String burgerPrice;
  final dynamic burgerColor;
  final String burgerImagePath;
  final String burgerProvider;

  const BurgerTile({
    super.key,
    required this.burgerFlavor,
    required this.burgerPrice,
    required this.burgerColor,
    required this.burgerImagePath,
    required this.burgerProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: burgerColor[100],
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
                    color: burgerColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$burgerPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: burgerColor[800],
                    ),
                  ),
                ),
              ],
            ),
            // Imagen
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12, horizontal: 24),
                child: Image.asset(burgerImagePath),
            ),
            // Nombre
            Text(
              burgerFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            // Proveedor
            Text(
              burgerProvider,
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
                      // Crear el item con los datos de esta hamburguesa
                      final item = CartItem(
                        name: burgerFlavor,
                        price: double.parse(burgerPrice),
                        imagePath: burgerImagePath,
                      );
                      cart.addItem(item);
                      // Feedback visual
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${burgerFlavor} agregado al carrito'),
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