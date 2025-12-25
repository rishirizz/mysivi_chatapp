import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/features/users/data/user.model.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.event.dart';
import 'package:mysivi_chatapp/features/users/presentation/bloc/user.state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState.initial()) {
    on<AddUserEvent>(_onAddUser);
  }

  void _onAddUser(AddUserEvent event, Emitter<UsersState> emit) async {
    try {
      final updatedUsers = List<UserModel>.from(state.users);
      emit(state.copyWith(status: UsersStatus.loading));
      await Future.delayed(Duration(seconds: 1));
      updatedUsers.add(UserModel(name: event.name));
      emit(state.copyWith(users: updatedUsers, status: UsersStatus.success));
    } catch (e) {
      emit(state.copyWith(errorMessage: '$e'));
    }
  }
}
