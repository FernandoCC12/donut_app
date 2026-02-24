import 'package:donut_app/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  //Lista de hamburguesas
  final List burgerOnSale = [
    [
      'BBQ Burger',
      '185',
      Colors.orange,
      'lib/images/burger-1.png',
      'Five Guys',
    ],
    [
      'Swiss Burger',
      '195',
      Colors.orange,
      'lib/images/burger-2.png',
      'Wendys',
    ],
    [
      'Jalapeño Burger',
      '210',
      Colors.orange,
      'lib/images/burger-3.png',
      'Shake Shack',
    ],
    [
      'Ranch Burger',
      '175',
      Colors.orange,
      'lib/images/burger-4.png',
      'In N Out',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: burgerOnSale.length,
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgerOnSale[index][0],
          burgerPrice: burgerOnSale[index][1],
          burgerColor: burgerOnSale[index][2],
          burgerImagePath: burgerOnSale[index][3],
          burgerProvider: burgerOnSale[index][4],
        );
      },
    );
  }
}
