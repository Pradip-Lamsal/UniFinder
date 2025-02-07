import 'package:bus_application/core/error/failure.dart';
import 'package:bus_application/features/auth/domain/entity/auth_entity.dart';
import 'package:bus_application/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'repository.mock.dart';

void main() {
  late MockAuthRepository repository;
  late RegisterUseCase useCase;

  setUp(() {
    repository = MockAuthRepository();
    useCase = RegisterUseCase(repository);
    registerFallbackValue(const AuthEntity(
      username: 'Pradip Lamsal',
      fName: 'Pradip',
      lName: 'Lamsal',
      phone: '9840015300',
      password: 'password123',
      image: 'profile.jpg',
    ));
  });

  const registerParams = RegisterUserParams(
    username: 'Pradip Lamsal',
    fname: 'Pradip',
    lname: 'Lamsal',
    phone: '9840015300',
    password: 'password123',
    image: 'profile.jpg',
  );

  group('RegisterUseCase Tests', () {
    test('should return Failure when email is already in use', () async {
      // Arrange
      when(() => repository.registercustomer(any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: "Username is already registered")));

      // Act
      final result = await useCase(registerParams);

      // Assert
      expect(result,
          const Left(ApiFailure(message: "Username is already registered")));
      verify(() => repository.registercustomer(any())).called(1);
    });

    test('should return Failure when required fields are missing', () async {
      // Arrange
      const invalidParams = RegisterUserParams(
        username: 'Pradip Lamsal',
        fname: 'Pradip',
        lname: 'Lamsal',
        phone: '9840015300',
        password: 'password123',
        image: 'profile.jpg',
      );

      when(() => repository.registercustomer(any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: "One or more credentials are empty")));

      // Act
      final result = await useCase(invalidParams);

      // Assert
      expect(result,
          const Left(ApiFailure(message: "One or more credentials are empty")));
      verify(() => repository.registercustomer(any())).called(1);
    });

    test('should return Failure when there is Api Failure', () async {
      // Arrange
      when(() => repository.registercustomer(any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: "Unexpected server error")));

      // Act
      final result = await useCase(registerParams);

      // Assert
      expect(
          result, const Left(ApiFailure(message: "Unexpected server error")));
      verify(() => repository.registercustomer(any())).called(1);
    });

    test('should successfully register a user and return Right(null)',
        () async {
      // Arrange
      when(() => repository.registercustomer(any()))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(registerParams);

      // Assert
      expect(result, const Right(null));
      verify(() => repository.registercustomer(any())).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should return Failure when passwords do not match', () async {
      // Arrange
      const mismatchedParams = RegisterUserParams(
        username: 'Pradip Lamsal',
        fname: 'Pradip',
        lname: 'Lamsal',
        phone: '9840015300',
        password: 'password123',
        image: 'profile.jpg',
      );

      when(() => repository.registercustomer(any())).thenAnswer((_) async =>
          const Left(ApiFailure(message: "Passwords do not match")));

      // Act
      final result = await useCase(mismatchedParams);

      // Assert
      expect(result, const Left(ApiFailure(message: "Passwords do not match")));
      verify(() => repository.registercustomer(any())).called(1);
    });
  });
}
