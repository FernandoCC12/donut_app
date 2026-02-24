import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/cart.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final dynamic pizzaColor;
  final String pizzaImagePath;
  final String pizzaProvider;

  const PizzaTile({
    super.key,
    required this.pizzaFlavor,
    required this.pizzaPrice,
    required this.pizzaColor,
    required this.pizzaImagePath,
    required this.pizzaProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: pizzaColor[100],
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
                    color: pizzaColor[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$pizzaPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: pizzaColor[800],
                    ),
                  ),
                ),
              ],
            ),
            // Imagen
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(pizzaImagePath),
            ),
            // Nombre
            Text(
              pizzaFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 4),
            // Proveedor
            Text(
              pizzaProvider,
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
                      // Crear el ítem con los datos de esta pizza
                      final item = CartItem(
                        name: pizzaFlavor,
                        price: double.parse(pizzaPrice),
                        imagePath: pizzaImagePath,
                      );
                      cart.addItem(item);
                      // Feedback visual
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${pizzaFlavor} agregado al carrito'),
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