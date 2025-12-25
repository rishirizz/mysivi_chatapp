import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.bloc.dart';
import 'package:mysivi_chatapp/features/splash/presentation/screens/splash.screen.dart';
import 'package:mysivi_chatapp/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SplashBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder = AppRouter().getPageRoute(settings);
          return MaterialPageRoute(
            builder: (ctx) {
              return builder(ctx);
            },
          );
        },
      ),
    );
  }
}
