import 'package:example_menu/domain/models/info_card.dart';
import 'package:flutter/material.dart';

class SelectCardProvider with ChangeNotifier {
  carType selectedCard = carType.WEIGHT;

  selectCard(cardTitle) {
    selectedCard = cardTitle;
    notifyListeners();
  }

  initSelectedCard() {
    selectedCard = carType.WEIGHT;
    notifyListeners();
  }

  Color isSelected(
    cardTitle, {
    required Color isTrueColor,
    required Color isFalseColor,
  }) => selectedCard == cardTitle ? isTrueColor : isFalseColor;
}
