import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class Receipt extends StatelessWidget {
  final List<CartItem> cartItems;
  final double totalPrice;

  const Receipt({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Receipt',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        leading: const SizedBox.shrink(),
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).clear();
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item.pet.name),
                  subtitle: Text('\$${item.pet.price.toStringAsFixed(2)}'),
                  trailing: Text('Qty: ${item.quantity}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Due:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
