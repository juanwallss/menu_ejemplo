import 'package:flutter/material.dart';

class BottonSearch extends StatelessWidget {
  const BottonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(child: Placeholder(color: Colors.red)),
            );
          },
        );
      },
      backgroundColor: Color(0xFF21BFBD),
      child: Icon(Icons.search, color: Colors.white),
    );
  }
}
