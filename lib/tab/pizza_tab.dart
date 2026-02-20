import 'package:donut_app/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
   PizzaTab({super.key});

  //List of donuts
  final List pizzaOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Pepperoni',
      '160',
      Colors.brown,
      "lib/images/pizza-1.png",
      'Dominos',
    ],
    [
      'BBQ Chicken',
      '185',
      Colors.red,
      "lib/images/pizza-2.png",
      'Pizza Hut',
    ],
    [
      'Hawaiian Deluxe',
      '175',
      Colors.blue,
      "lib/images/pizza-3.png",
      'Little Caesars',
    ],
    [
      'Cheese Special', 
      '210', 
      Colors.purple, 
      "lib/images/pizza-4.png", 
      'Papa Johns'
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
      itemCount: pizzaOnSale.length,
      //Lo que se va a construir
      itemBuilder: (context, index) {
      return PizzaTile(
        pizzaFlavor: pizzaOnSale[index][0],
        pizzaPrice: pizzaOnSale[index][1],
        pizzaColor: pizzaOnSale[index][2],
        pizzaImagePath: pizzaOnSale[index][3],
        pizzaProvider: pizzaOnSale[index][4],
        );
      },
    );
  }
}
 