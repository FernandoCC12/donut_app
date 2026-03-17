import 'package:flutter/material.dart';
import '../utils/racing_tile.dart';

class TiresTab extends StatelessWidget {
   TiresTab({super.key});

  final List tiresOnSale = [
    ['P Zero Soft', '8000', Colors.red, "https://images.f1estore.com/pirelli-p-zero-red-soft-tyre-keyring_ss4_p-12053913+u-8316m924jqu68f44z6be+v-583eb8f2bdc648489dbd1bd40e347717.jpg?_hv=2&w=600", 'Pirelli'],
    ['P Zero Medium', '8000', Colors.yellow, "https://images.f1estore.com/pirelli-p-zero-yellow-medium-tyre-keyring_ss4_p-12053911+u-6m8n494f4848j44z6be+v-583eb8f2bdc648489dbd1bd40e347717.jpg?_hv=2&w=600", 'Pirelli'],
    ['P Zero Hard', '8000', Colors.white, "https://images.f1estore.com/pirelli-p-zero-white-hard-tyre-keyring_ss4_p-12053912+u-8316m924jqu68f44z6be+v-583eb8f2bdc648489dbd1bd40e347717.jpg?_hv=2&w=600", 'Pirelli'],
    ['Cinturato Wet', '9000', Colors.blue, "https://images.f1estore.com/pirelli-cinturato-blue-wet-tyre-keyring_ss4_p-12053914+u-8316m924jqu68f44z6be+v-583eb8f2bdc648489dbd1bd40e347717.jpg?_hv=2&w=600", 'Pirelli'],
    ['Cinturato Inter', '8500', Colors.green, "https://images.f1estore.com/pirelli-cinturato-green-intermediate-tyre-keyring_ss4_p-12053915+u-8316m924jqu68f44z6be+v-583eb8f2bdc648489dbd1bd40e347717.jpg?_hv=2&w=600", 'Pirelli'],
    ['Pilot Sport 5', '6500', Colors.blue[900], "https://m.media-amazon.com/images/I/51u-eJ6n7PL._AC_SX679_.jpg", 'Michelin'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.5,
      ),
      itemCount: tiresOnSale.length,
      itemBuilder: (context, index) {
        return RacingTile (
          itemName: tiresOnSale[index][0],
          itemPrice: tiresOnSale[index][1],
          itemColor: tiresOnSale[index][2],
          itemImagePath: tiresOnSale[index][3],
          itemBrand: tiresOnSale[index][4],
        );
      }
    );
  }
}
