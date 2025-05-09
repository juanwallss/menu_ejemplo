import 'package:example_menu/domain/models/info_card.dart';
import 'package:example_menu/presentations/provider/select_card_provider.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildInfoCard extends StatefulWidget {
  final InfoCard infoCard;

  const BuildInfoCard({super.key, required this.infoCard});

  @override
  State<BuildInfoCard> createState() => _BuildInfoCardState();
}

class _BuildInfoCardState extends State<BuildInfoCard> with CustomText {
  @override
  Widget build(BuildContext context) {
    final SelectCardProvider selectCardController =
        context.watch<SelectCardProvider>();
    return InkWell(
      onTap: () {
        selectCardController.selectCard(widget.infoCard.cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: selectCardController.isSelected(
            widget.infoCard.cardTitle,
            isTrueColor: Color(0xFF7A9BEE),
            isFalseColor: Colors.white,
          ),
          border: Border.all(
            color: selectCardController.isSelected(
              widget.infoCard.cardTitle,
              isTrueColor: Colors.transparent,
              isFalseColor: Colors.grey,
            ),
            style: BorderStyle.solid,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0),
              child: getBodyText(
                text: widget.infoCard.cardTitle.name,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                colorText: selectCardController.isSelected(
                  widget.infoCard.cardTitle,
                  isTrueColor: Colors.white,
                  isFalseColor: Color.fromRGBO(158, 158, 158, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getBodyText(
                    text: widget.infoCard.info,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    colorText: selectCardController.isSelected(
                      widget.infoCard.cardTitle,
                      isTrueColor: Colors.white,
                      isFalseColor: Colors.black,
                    ),
                  ),
                  getBodyText(
                    text: widget.infoCard.unit.toUpperCase(),
                    fontSize: 18,
                    colorText: selectCardController.isSelected(
                      widget.infoCard.cardTitle,
                      isTrueColor: Colors.white,
                      isFalseColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
