// import 'package:hive/hive.dart';

// import '../../domain/entity/auth_entity.dart';

// part 'auth_api_model.g.dart';

// @HiveType(
//     typeId:
//         3) // Use a unique typeId (different from University, Course, Consultancy)
// class AuthApiModel extends HiveObject {
//   @HiveField(0)
//   final String id;

//   @HiveField(1)
//   final String token;

//   AuthApiModel({
//     required this.id,
//     required this.token,
//   });

//   factory AuthApiModel.fromEntity(Auth auth) {
//     return AuthApiModel(
//       id: auth.id,
//       token: auth.token,
//     );
//   }

//   Auth toEntity() {
//     return Auth(
//       id: id,
//       token: token,
//     );
//   }
// }
