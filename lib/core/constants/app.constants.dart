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
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      label: 'Chat',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Offers'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
}
