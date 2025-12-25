import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.event.dart';
import 'package:mysivi_chatapp/features/splash/presentation/bloc/splash.state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashLoadedEvent>(_splashLoaded);
  }

  void _splashLoaded(SplashLoadedEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith(splashStatus: SplashStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(splashStatus: SplashStatus.success));
  }
}
