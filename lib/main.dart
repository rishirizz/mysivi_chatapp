import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/features/chat_history/presentation/bloc/chat_history.bloc.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.bloc.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.bloc.dart';
import 'package:mysivi_chatapp/features/splash/presentation/screens/splash.screen.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.bloc.dart';
import 'package:mysivi_chatapp/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => UsersBloc()),
        BlocProvider(create: (_) => ChatHistoryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: .fromSeed(seedColor: Colors.blue[900]!),
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
