import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/widgets/botton_search.dart';
import 'package:example_menu/presentations/widgets/build_food_item.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/tamplate_screens.dart';
import 'package:example_menu/domain/models/food.dart';
import 'package:flutter/material.dart';

class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen>
    with CustomText, Header {
  
  String _searchQuery = '';
  List<Food> _filteredFoodList = [];
  
  @override
  void initState() {
    super.initState();
    _filteredFoodList = Foods.foods;
  }
  
  void _filterFoods(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty || query.trim().isEmpty) {
        _filteredFoodList = Foods.foods;
      } else {
        _filteredFoodList = Foods.foods
            .where((food) => food.foodName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }  @override
  Widget build(BuildContext context) {
    return TamplateScreens(
      backgroundColor: Color(0xFF21BFBD),
      header: getHeader(context: context),
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
              child: _filteredFoodList.isEmpty 
                ? Center(
                    child: Text(
                      'No se encontraron resultados para "$_searchQuery"',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredFoodList.length,
                    itemBuilder: (context, index) {
                      return BuildFoodItem(food: _filteredFoodList[index]);
                    },
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: BottonSearch(onSearch: _filterFoods),
    );
  }
}
