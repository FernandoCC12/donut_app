import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Fondo Asfalto
      appBar: AppBar(
        title: const Text('TU GARAGE', 
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 18, color: Colors.white)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Tu garage está vacío', 
                    style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E), // Gris muy oscuro
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[800]!, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      // Icono simulando el producto
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[900], 
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red[900]!, width: 0.5)
                        ),
                        child: const Icon(Icons.sports_motorsports, color: Colors.white70, size: 30),
                      ),
                      const SizedBox(width: 16),
                      // Datos del producto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name.toUpperCase(), 
                              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Colors.white)),
                            const SizedBox(height: 4),
                            Text('\$${item.price.toStringAsFixed(2)}', 
                              style: TextStyle(color: Colors.red[600], fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      // Controles
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle, color: Colors.grey, size: 28),
                                onPressed: () => cart.restar(item),
                              ),
                              Text('${item.quantity}', 
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
                              IconButton(
                                icon: Icon(Icons.add_circle, color: Colors.red[600], size: 28),
                                onPressed: () => cart.sumar(item),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.grey, size: 28),
                                onPressed: () => cart.eliminar(item),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      // --- RESUMEN DE COBROS ---
      bottomNavigationBar: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) return const SizedBox.shrink();

          return Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 20, offset: const Offset(0, -5))],
              border: Border.all(color: Colors.grey[850]!, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _crearFilaCosto('SUBTOTAL', cart.subtotal),
                _crearFilaCosto('IVA', cart.iva),
                _crearFilaCosto('ENVÍO', cart.costoEnvio),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Colors.grey, thickness: 0.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('TOTAL FINAL', 
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic)),
                    Text('\$${cart.totalFinal.toStringAsFixed(2)}', 
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.red[600], fontStyle: FontStyle.italic)),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 5,
                      shadowColor: Colors.red.withOpacity(0.5),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CheckoutPage()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CONTINUAR AL PAGO', 
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _crearFilaCosto(String titulo, double monto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1)),
          Text('\$${monto.toStringAsFixed(2)}', 
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}