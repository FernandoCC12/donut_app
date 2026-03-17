import 'package:flutter/material.dart';
import '../utils/racing_tile.dart';

class AccessoriesTab extends StatelessWidget {
   AccessoriesTab({super.key});

  final List accessoriesOnSale = [
    ['Llavero Volante', '250', Colors.blueGrey, "https://m.media-amazon.com/images/I/51u-eJ6n7PL._AC_SX679_.jpg", 'F1 Store'],
    ['Taza de Pista', '350', Colors.black, "https://m.media-amazon.com/images/I/61U-eJ6n7PL._AC_SX679_.jpg", 'F1 Store'],
    ['Mochila Racing', '1500', Colors.red, "https://m.media-amazon.com/images/I/71Yy8-Y6hKL._AC_SL1500_.jpg", 'Puma'],
    ['Paraguas Escudería', '850', Colors.blue, "https://m.media-amazon.com/images/I/61vGvWn3Q6L._AC_SX679_.jpg", 'Red Bull'],
    ['Guantes Karting', '1200', Colors.yellow[700], "https://m.media-amazon.com/images/I/71S90fSfLhL._AC_SL1500_.jpg", 'Alpinestars'],
    ['Casco Mini 1:2', '3500', Colors.deepOrange, "https://m.media-amazon.com/images/I/71+0KxK1JLL._AC_SL1500_.jpg", 'Bell'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.5,
      ),
      itemCount: accessoriesOnSale.length,
      itemBuilder: (context, index) {
        return RacingTile (
          itemName: accessoriesOnSale[index][0],
          itemPrice: accessoriesOnSale[index][1],
          itemColor: accessoriesOnSale[index][2],
          itemImagePath: accessoriesOnSale[index][3],
          itemBrand: accessoriesOnSale[index][4],
        );
      }
    );
  }
}
