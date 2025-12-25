import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/core/route_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = RouteConstants.homeScreen;
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
