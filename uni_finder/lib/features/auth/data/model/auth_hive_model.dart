import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 1) // Replace with a unique ID if not using HiveTableConstant
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String username;

  AuthHiveModel({
    String? userId,
    required this.username,
    required this.password,
    required this.email,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        username = '',
        password = '',
        email = '';

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      username: entity.username,
      password: entity.password,
      email: entity.email,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      username: username,
      password: password,
      email: email,
    );
  }

  @override
  List<Object?> get props => [userId, username, password, email];
}
