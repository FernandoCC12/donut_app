import 'package:flutter/material.dart';
import '../utils/racing_tile.dart';

class ModelsTab extends StatelessWidget {
   ModelsTab({super.key});

  final List modelsOnSale = [
    ['RB19 1:43', '2500', Colors.blue, "lib/images/racing/model_rb19.png", 'Minichamps'],
    ['W14 1:43', '2400', Colors.grey, "lib/images/racing/model_w14.png", 'Spark'],
    ['SF-23 1:43', '2800', Colors.red, "lib/images/racing/model_sf23.png", 'Bburago'],
    ['MCL60 1:43', '2300', Colors.orange, "lib/images/racing/model_mcl60.png", 'Minichamps'],
    ['AMR23 1:43', '2600', Colors.green[900], "lib/images/racing/model_amr23.png", 'Spark'],
    ['A523 1:43', '2200', Colors.pink[200], "lib/images/racing/model_a523.png", 'Bburago'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.5,
      ),
      itemCount: modelsOnSale.length,
      itemBuilder: (context, index) {
        return RacingTile (
          itemName: modelsOnSale[index][0],
          itemPrice: modelsOnSale[index][1],
          itemColor: modelsOnSale[index][2],
          itemImagePath: modelsOnSale[index][3],
          itemBrand: modelsOnSale[index][4],
        );
      }
    );
  }
}
