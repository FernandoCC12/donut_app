import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';
import '../tab/caps_tab.dart';
import '../tab/shirts_tab.dart';
import '../tab/models_tab.dart';
import '../tab/tires_tab.dart';
import '../tab/accessories_tab.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: Icons.sports_motorsports, iconName: 'Gorras'),
    const MyTab(iconPath: Icons.checkroom, iconName: 'Playeras'),
    const MyTab(iconPath: Icons.toys, iconName: 'Modelos'),
    const MyTab(iconPath: Icons.album, iconName: 'Llantas'),
    const MyTab(iconPath: Icons.key, iconName: 'Extras'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212), // Fondo casi negro (asfalto)
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado Superior (Reemplaza al espacio muerto)
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Texto principal
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PADDOCK',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text(
                              'Motor',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: Colors.white, // Letra en blanco
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              'Sport.',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: Colors.red[600], // Acento Racing
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Detalle deportivo (Bandera a cuadros o algo similar)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.shade900, width: 1.5),
                      ),
                      child: const Icon(Icons.sports_score, color: Colors.white, size: 28),
                    )
                  ],
                ),
              ),

            // TabBar Responsiva (Estilo Neon/F1)
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.red[600],
              indicatorWeight: 4,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              padding: const EdgeInsets.only(left: 12),
              indicatorSize: TabBarIndicatorSize.label, // Solo subraya la letra
              tabs: myTabs,
              dividerColor: Colors.transparent,
            ),
            
            // Contenido de los Tabs
            Expanded(
              child: TabBarView(
                children: [
                  CapsTab(),
                  ShirtsTab(),
                  ModelsTab(),
                  TiresTab(),
                  AccessoriesTab(),
                ],
              ),
            ),
            
            // Banner de Carrito Flotante y Minimalista
            Consumer<Cart>(
              builder: (context, cart, child) {
                if (cart.totalArticulos == 0) return const SizedBox.shrink(); // Ocultar si está vacío
                
                return Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cart.totalArticulos} artículos',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${cart.totalFinal.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CartPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Ver Carrito',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
}