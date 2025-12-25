import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key, required this.placeholderText});

  final String placeholderText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        placeholderText,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
