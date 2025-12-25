class UserModel {
  final String name;

  const UserModel({required this.name});

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '';
}
