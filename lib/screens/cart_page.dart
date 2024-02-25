import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_styles.dart';
import '../models/cart.dart';
import 'receipt.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(
              child: Text('Your cart is empty.'),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart.items[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(cartItem.pet.image,
                            fit: BoxFit.cover, width: 50, height: 50),
                      ),
                      title: Text(cartItem.pet.name),
                      subtitle: Text(
                          '\$${cartItem.pet.price.toStringAsFixed(0)} • ${cartItem.pet.location}'),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Qty: ${cartItem.quantity}'),
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.minus_circled,
                              size: 28,
                            ),
                            onPressed: () {
                              cart.remove(cartItem.pet);
                            },
                          ),
                          IconButton(
                              icon: const Icon(
                                CupertinoIcons.add_circled,
                                size: 28,
                              ),
                              onPressed: () {
                                cart.add(cartItem.pet);
                              })
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final cart = Provider.of<Cart>(context, listen: false);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Receipt(
                              cartItems: cart.items.toList(),
                              totalPrice: cart.totalPrice,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: goldYellow,
                        minimumSize: const Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
