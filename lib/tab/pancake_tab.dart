import 'package:donut_app/utils/pancake_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  PancakeTab({super.key});

  final List pancakeOnSale = [
[
      'Caramel Dream',
      '85',
      Colors.brown,
      "lib/images/pancake-1.png",
      'IHOP',
    ],
    [
      'Red Velvet Stack',
      '115',
      Colors.red,
      "lib/images/pancake-2.png",
      'The Pancake House',
    ],
    [
      'Blueberry Heaven',
      '145',
      Colors.blue,
      "lib/images/pancake-3.png",
      'Krispy Kreme',
    ],
    [
      'Purple Delight', 
      '190', 
      Colors.purple, 
      "lib/images/pancake-4.png", 
      'Dennys'
      ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Se encarga de acomodar elementos dentro del grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //Cantidad de columnas
      crossAxisCount: 2,
      //Tamaño de cada columna
      childAspectRatio: 1 / 1.5,
      ),
      //Cantidad de elementos
      itemCount: pancakeOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return PancakeTile(
        pancakeFlavor: pancakeOnSale[index][0],
        pancakePrice: pancakeOnSale[index][1],
        pancakeColor: pancakeOnSale[index][2],
        pancakeImagePath: pancakeOnSale[index][3],
        pancakeProvider: pancakeOnSale[index][4],
        );
      },
    );
  }
}
