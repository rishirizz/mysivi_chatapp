import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
    required this.userInitials,
    required this.colors,
  });

  final String userInitials;
  final List<Color> colors;

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
          colors: colors,
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
