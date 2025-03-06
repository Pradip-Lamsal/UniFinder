import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId; // Maps to customerId in AuthHiveModel
  final String fName;
  final String lName;
  final String? image;
  final String email;
  final String username;
  final String password;

  const AuthEntity({
    this.userId,
    required this.fName,
    required this.lName,
    this.image,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userId,
        fName,
        lName,
        image,
        email,
        username,
        password,
      ];
}
