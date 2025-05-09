import 'package:flutter/material.dart';

class TamplateScreens extends StatelessWidget {
  final Widget? headerWidgetText;
  final AppBar header;
  final Color backgroundColor;
  final Widget body;
  final Widget? floatingActionButton;
  final bool isDetailScreen;
  const TamplateScreens({
    super.key,
    this.headerWidgetText,
    required this.header,
    required this.backgroundColor,
    required this.body,
    this.floatingActionButton,
    this.isDetailScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header,
      body:
          isDetailScreen
              ? _detailScreen(context, body)
              : _notDetailScreen(context, body),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _notDetailScreen(BuildContext context, Widget body) => Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 50.0, top: 20.0),
        child: headerWidgetText,
      ),
      SizedBox(height: 55.0),
      Container(
        height: MediaQuery.of(context).size.height * 0.737,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0)),
        ),
        child: body,
      ),
    ],
  );

  Widget _detailScreen(BuildContext context, Widget body) => body;
}
