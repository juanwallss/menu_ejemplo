enum carType { WEIGHT, CALORIES, VITAMINS, AVAIL }

class InfoCard {
  final carType cardTitle;
  final String info;
  final String unit;

  InfoCard(this.cardTitle, this.info, this.unit);
}
