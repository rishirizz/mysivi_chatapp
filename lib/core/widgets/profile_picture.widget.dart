import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key, required this.userInitials});

  final String userInitials;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Colors.blue, Colors.purpleAccent],
        ),
      ),
      child: Center(
        child: Text(
          userInitials,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
