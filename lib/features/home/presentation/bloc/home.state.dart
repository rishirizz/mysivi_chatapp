import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({required this.selectedIndex});

  final int selectedIndex;

  factory HomeState.initial() {
    return HomeState(selectedIndex: 0);
  }

  HomeState copyWith({int? selectedIndex}) {
    return HomeState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object?> get props => [selectedIndex];
}
