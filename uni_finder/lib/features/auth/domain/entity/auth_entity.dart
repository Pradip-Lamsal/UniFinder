import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;

  final String username;
  final String password;
  final String email;

  const AuthEntity({
    this.userId,
    required this.username,
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [userId, username, password, email];
}
