abstract class HomeEvent {}

class IndexChangedEvent extends HomeEvent {
  final int selectedIndex;
  IndexChangedEvent({required this.selectedIndex});
}
