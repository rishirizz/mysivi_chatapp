import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.event.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<IndexChangedEvent>(_onIndexChanged);
  }

  void _onIndexChanged(IndexChangedEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(selectedIndex: event.selectedIndex)
    );
  }
}
