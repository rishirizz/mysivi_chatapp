import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/core/route_constants.dart';
import 'package:mysivi_chatapp/core/widgets/placeholder.widget.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  static String routeName = RouteConstants.offerScreen;

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return PlaceholderWidget(placeholderText: 'Offers');
  }
}
