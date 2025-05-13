import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';

class FloatingCartWidget extends StatelessWidget {
  const FloatingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.cart.items.isEmpty
        ? Center(
          child: Text(
            'Carrito vacío',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        )
        : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartProvider.cart.items.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cart.items[index];
                return ListTile(
                  leading: Image.asset(
                    item.food.imgPath,
                    width: 75,
                    height: 75,
                  ),
                  title: Text(item.food.foodName),
                  subtitle: Text('Cantidad: ${item.quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      cartProvider.removeFromCart(item.food);
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total: ${cartProvider.cart.totalPrice.toStringAsFixed(2)}',
              ),
            ),
          ],
        );
  }
}
