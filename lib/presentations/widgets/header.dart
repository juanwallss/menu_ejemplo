import 'package:example_menu/presentations/widgets/floating_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';

mixin Header {
  AppBar getHeader({Widget? widgetChildText, BuildContext? context}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: widgetChildText,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: () {
          if (context != null) {
            context.pop();
          }
        },
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_basket),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                showModalBottomSheet(
                  context: context!,
                  builder: (context) => FloatingCartWidget(),
                );
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final itemCount = cartProvider.cart.totalItems;
                  return itemCount > 0
                      ? CircleAvatar(
                        radius: 8,
                        backgroundColor: const Color.fromARGB(255, 0, 151, 118),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
