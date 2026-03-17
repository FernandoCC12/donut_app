import 'package:flutter/material.dart';
import '../utils/racing_tile.dart';

class CapsTab extends StatelessWidget {
   CapsTab({super.key});

  final List capsOnSale = [
    ['Red Bull Racing', '850', Colors.blue, "https://m.media-amazon.com/images/I/61kM2o9B7tL._AC_SL1500_.jpg", 'New Era'],
    ['Mercedes AMG', '890', Colors.grey, "https://m.media-amazon.com/images/I/71u9cO0yY6L._AC_SX679_.jpg", 'Puma'],
    ['Ferrari SF', '950', Colors.red, "https://m.media-amazon.com/images/I/71YvK4XqQeL._AC_SX679_.jpg", 'Puma'],
    ['McLaren Lando', '820', Colors.orange, "https://m.media-amazon.com/images/I/71y-r2P0m5L._AC_SX679_.jpg", 'New Era'],
    ['Aston Martin RP', '780', const Color(0xFF00352F), "https://m.media-amazon.com/images/I/51B6O-u-7kL._AC_SX679_.jpg", 'Boss'],
    ['Alpine BWT', '750', Colors.blue[300], "https://m.media-amazon.com/images/I/61vGvWn3Q6L._AC_SX679_.jpg", 'Kappa'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.5,
      ),
      itemCount: capsOnSale.length,
      itemBuilder: (context, index) {
        return RacingTile (
          itemName: capsOnSale[index][0],
          itemPrice: capsOnSale[index][1],
          itemColor: capsOnSale[index][2],
          itemImagePath: capsOnSale[index][3],
          itemBrand: capsOnSale[index][4],
        );
      }
    );
  }
}
