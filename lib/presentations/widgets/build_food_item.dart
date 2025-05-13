import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:example_menu/presentations/widgets/food_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BuildFoodItem extends StatelessWidget with FoodText {
  final Food food;
  const BuildFoodItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        context.push('/detail/${food.id}');
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: food.imgPath,
                child: Image(
                  image: AssetImage(food.imgPath),
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [getFoodName(), SizedBox(height: 5.0), getPrice()],
              ),
              IconButton(onPressed: () {
                cartProvider.addToCart(food);
              }, icon: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFoodName() {
    return getFoodText(food.foodName, fontWeight: FontWeight.bold);
  }

  Widget getPrice() {
    return getFoodText("\$${food.price.toString()}", fontSize: 15, colorText: Colors.grey);
  }
}
