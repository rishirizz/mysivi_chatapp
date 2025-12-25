import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.bloc.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.event.dart';
import 'package:mysivi_chatapp/features/home/presentation/bloc/home.state.dart';

void main() {
  group('HomeBloc', () {
    late HomeBloc homeBloc;

    setUp(() {
      homeBloc = HomeBloc();
    });

    tearDown(() {
      homeBloc.close();
    });

    test('initial state is HomeState.initial()', () {
      expect(homeBloc.state, HomeState.initial());
    });

    blocTest<HomeBloc, HomeState>(
      'emits new index when IndexChangedEvent is added',
      build: () => HomeBloc(),
      act: (bloc) => bloc.add(IndexChangedEvent(selectedIndex: 2)),
      expect: () => [const HomeState(selectedIndex: 2)],
    );
  });
}
