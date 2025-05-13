import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/domain/models/info_card.dart';

class Foods {
  static final List<Food> foods = [
    Food(
      id: 1,
      imgPath: 'assets/plate1.png',
      foodName: 'Salmon bowl',
      price: 24.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '300', 'G'),
        InfoCard(carType.CALORIES, '367', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, B6', 'VIT'),
        InfoCard(carType.AVAIL, 'NO', 'AV'),
      ],
    ),
    Food(
      id: 2,
      imgPath: 'assets/plate2.png',
      foodName: 'Spring bowl',
      price: 22.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '250', 'G'),
        InfoCard(carType.CALORIES, '300', 'CAL'),
        InfoCard(carType.VITAMINS, 'C, D', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 3,
      imgPath: 'assets/plate6.png',
      foodName: 'Avocado bowl',
      price: 26.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '250', 'G'),
        InfoCard(carType.CALORIES, '300', 'CAL'),
        InfoCard(carType.VITAMINS, 'C, D', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 4,
      imgPath: 'assets/plate5.png',
      foodName: 'Berry bowl',
      price: 24.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '300', 'G'),
        InfoCard(carType.CALORIES, '367', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, B6', 'VIT'),
        InfoCard(carType.AVAIL, 'NO', 'AV'),
      ],
    ),
  ];
}
