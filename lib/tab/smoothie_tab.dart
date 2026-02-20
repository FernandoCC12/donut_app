import 'package:donut_app/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
   SmoothieTab({super.key});

  //List of donuts
  final List smoothieOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
[
      'Tropical Blast',
      '110',
      Colors.brown,
      "lib/images/smoothie-1.png",
      'Jamba Juice',
    ],
    [
      'Berry Fusion',
      '105',
      Colors.red,
      "lib/images/smoothie-2.png",
      'Smoothie King',
    ],
    [
      'Mango Paradise',
      '165',
      Colors.blue,
      "lib/images/smoothie-3.png",
      'Planet Smoothie',
    ],
    [
      'Purple Energy', 
      '130', 
      Colors.purple, 
      "lib/images/smoothie-4.png",
      'Tropical Smoothie Cafe'
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
      itemCount: smoothieOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return SmoothieTile(
        smoothieFlavor: smoothieOnSale[index][0],
        smoothiePrice: smoothieOnSale[index][1],
        smoothieColor: smoothieOnSale[index][2],
        smoothieImagePath: smoothieOnSale[index][3],
        smoothieProvider: smoothieOnSale[index][4],
        );
      },
    );
  }
}
 