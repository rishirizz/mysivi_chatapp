import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/constants/app.constants.dart';
import 'package:mysivi_chatapp/core/constants/route.constants.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.bloc.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.event.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = RouteConstants.homeScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: AppConstants.bottomNavigationWidgetList.elementAt(
              state.selectedIndex,
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFE0E0E0), 
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: AppConstants.bottomNavigationBarItemsList,
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.blue,
              onTap: (int index) {
                context.read<HomeBloc>().add(
                  IndexChangedEvent(selectedIndex: index),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
