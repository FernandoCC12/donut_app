import 'package:flutter/material.dart';
import '../utils/racing_tile.dart';

class ShirtsTab extends StatelessWidget {
   ShirtsTab({super.key});

  final List shirtsOnSale = [
    ['Polo Red Bull', '1500', Colors.blue, "https://m.media-amazon.com/images/I/61T2bK7zTfL._AC_SX679_.jpg", 'Castore'],
    ['T-Shirt Mercedes', '1200', Colors.grey, "https://m.media-amazon.com/images/I/61y-JvS6XNL._AC_SX679_.jpg", 'Puma'],
    ['Polo Ferrari', '1800', Colors.red, "https://m.media-amazon.com/images/I/61R-eJ6n7PL._AC_SX679_.jpg", 'Puma'],
    ['T-Shirt McLaren', '1350', Colors.orange, "https://m.media-amazon.com/images/I/610VfS6XNL._AC_SX679_.jpg", 'Castore'],
    ['Shirt Williams', '1100', Colors.blue[800], "https://m.media-amazon.com/images/I/61I-eJ6n7PL._AC_SX679_.jpg", 'Umbro'],
    ['Polo AlphaTauri', '1400', Colors.white, "https://m.media-amazon.com/images/I/61U-eJ6n7PL._AC_SX679_.jpg", 'AlphaTauri'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.5,
      ),
      itemCount: shirtsOnSale.length,
      itemBuilder: (context, index) {
        return RacingTile (
          itemName: shirtsOnSale[index][0],
          itemPrice: shirtsOnSale[index][1],
          itemColor: shirtsOnSale[index][2],
          itemImagePath: shirtsOnSale[index][3],
          itemBrand: shirtsOnSale[index][4],
        );
      }
    );
  }
}
