import 'package:equatable/equatable.dart';
import 'package:mysivi_chatapp/core/enums.dart';
import 'package:mysivi_chatapp/features/users/data/user.model.dart';


class UsersState extends Equatable {
  const UsersState({
    required this.users,
    required this.status,
    required this.errorMessage,
  });

  final List<UserModel> users;
  final UsersStatus status;
  final String errorMessage;

  factory UsersState.initial() {
    return const UsersState(
      users: [],
      status: UsersStatus.initial,
      errorMessage: '',
    );
  }

  UsersState copyWith({
    List<UserModel>? users,
    UsersStatus? status,
    String? errorMessage,
  }) {
    return UsersState(
      users: users ?? this.users,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [users, status, errorMessage];
}
