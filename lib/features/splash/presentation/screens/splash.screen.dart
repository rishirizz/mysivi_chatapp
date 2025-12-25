import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/core/route_constants.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.bloc.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.event.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = RouteConstants.splashScreen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc = context.read<SplashBloc>();
    splashBloc.add(SplashLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.splashStatus == SplashStatus.success) {
          _navigateToHomeScreen();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(child: Image.asset('assets/my_sivi_logo.webp')),
        ),
      ),
    );
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacementNamed(context, RouteConstants.homeScreen);
  }
}
