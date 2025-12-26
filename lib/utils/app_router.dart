import 'package:flutter/material.dart';
import 'package:mysivi_chatapp/features/chat/presentation/screens/chat.screen.dart';
import 'package:mysivi_chatapp/features/chat/presentation/screens/chat_details.screen.dart';
import 'package:mysivi_chatapp/features/home/presentation/screens/home.screen.dart';
import 'package:mysivi_chatapp/features/offers/presentation/screens/offer.screen.dart';
import 'package:mysivi_chatapp/features/settings/presentation/screens/settings.screen.dart';
import 'package:mysivi_chatapp/features/splash/presentation/screens/splash.screen.dart';

class AppRouter {
  WidgetBuilder getPageRoute(RouteSettings settings) {
    var routes = <String, WidgetBuilder>{
      SplashScreen.routeName: (BuildContext context) => const SplashScreen(),
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
      ChatScreen.routeName: (BuildContext context) => const ChatScreen(),
      ChatDetailsScreen.routeName: (BuildContext context) =>
          const ChatDetailsScreen(),
      OfferScreen.routeName: (BuildContext context) => const OfferScreen(),
      SettingsScreen.routeName: (BuildContext context) =>
          const SettingsScreen(),
    };
    return routes[settings.name]!;
  }
}
