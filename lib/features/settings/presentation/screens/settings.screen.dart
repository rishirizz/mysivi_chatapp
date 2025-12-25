import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/core/widgets/placeholder.widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static String routeName = RouteConstants.settingsScreen;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return PlaceholderWidget(placeholderText: 'Settings');
  }
}
