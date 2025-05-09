import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/widgets/botton_search.dart';
import 'package:example_menu/presentations/widgets/build_food_item.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/tamplate_screens.dart';
import 'package:flutter/material.dart';

class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen>
    with CustomText, Header {
  @override
  Widget build(BuildContext context) {
    final foodList = Foods.foods;
    return TamplateScreens(
      backgroundColor: Color(0xFF21BFBD),
      header: getHeader(),
      headerWidgetText: Row(
        children: [
          getHeaderText(text: 'Healthy', fontWeight: FontWeight.bold),
          SizedBox(width: 5),
          getHeaderText(text: 'Food'),
        ],
      ),
      body: ListView(
        primary: false,
        padding: EdgeInsets.only(left: 25.0, right: 20.0),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  return BuildFoodItem(food: foodList[index]);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: BottonSearch(),
    );
  }
}
