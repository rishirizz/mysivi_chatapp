import 'package:equatable/equatable.dart';
import 'package:mysivi_chatapp/core/enums.dart';

class SplashState extends Equatable {
  const SplashState({required this.splashStatus});

  final SplashStatus splashStatus;

  factory SplashState.initial() {
    return const SplashState(splashStatus: SplashStatus.initial);
  }

  SplashState copyWith({SplashStatus? splashStatus}) {
    return SplashState(splashStatus: splashStatus ?? this.splashStatus);
  }

  @override
  List<Object?> get props => [splashStatus];
}
