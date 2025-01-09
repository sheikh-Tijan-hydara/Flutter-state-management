import 'package:flutter/material.dart';
import 'components/grocery_item_tile.dart';
import 'package:shopping_cart/model/cart_model.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                })),
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            )),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 64,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Good Morning',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 24,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider()),
          const SizedBox(
            height: 24,
          ),

          // fresh items + grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Fresh Items',
              style: TextStyle(fontSize: 24, color: Colors.grey[600]),
            ),
          ),

          Expanded(child: Consumer<CartModel>(builder: (context, value, child) {
            return GridView.builder(
              itemCount: value.shopItems.length,
              padding: const EdgeInsets.all(12.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) {
                return GroceryItemTile(
                  name: value.shopItems[index][0],
                  imageUrl: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                  price: value.shopItems[index][1],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addToCart(context, index);
                  },
                );
              },
            );
          }))
        ]));
  }
}
