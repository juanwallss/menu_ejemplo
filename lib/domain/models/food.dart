import 'package:example_menu/domain/models/info_card.dart';

class Food {
  final int id;
  final String imgPath;
  final String foodName;
  final double price;
  final List<InfoCard>? infoCards;

  Food({
    required this.id,
    required this.imgPath,
    required this.foodName,
    required this.price,
    this.infoCards,
  });
}
