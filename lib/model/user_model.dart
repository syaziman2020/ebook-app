import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final int? age;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.age = 0,
  });
  @override
  List<Object?> get props => [
        id,
        email,
        name,
        age,
      ];
}
