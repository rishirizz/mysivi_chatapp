import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/features/chat/presentation/screens/chat.screen.dart';
import 'package:mysivi_chatapp/features/offers/presentation/screens/offer.screen.dart';
import 'package:mysivi_chatapp/features/settings/presentation/screens/settings.screen.dart';

class AppConstants {
  static const bottomNavigationWidgetList = <Widget>[
    ChatScreen(),
    OfferScreen(),
    SettingsScreen(),
  ];

  static const bottomNavigationBarItemsList = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Offers'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
}
