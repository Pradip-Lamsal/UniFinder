import 'package:bus_application/core/error/failure.dart';
import 'package:bus_application/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'repository.mock.dart';
import 'token.mock.dart';

void main() {
  late MockAuthRepository authRepository;
  late MockTokenSharedPrefs tokenStorage;
  late LoginUseCase loginUseCase;

  setUp(() {
    authRepository = MockAuthRepository();
    tokenStorage = MockTokenSharedPrefs();
    loginUseCase = LoginUseCase(authRepository, tokenStorage);
  });

  const loginData = LoginParams(
    username: "pradip",
    password: "pradip123",
  );

  const mockToken = "test_jwt_token";

  group('Login_Use_Case Tests', () {
    test('returns Failure when credentials are incorrect', () async {
      // Arrange
      when(() => authRepository.logincustomer(any(), any())).thenAnswer(
          (_) async => const Left(ApiFailure(message: "Invalid credentials")));

      // Act
      final result = await loginUseCase(loginData);

      // Assert
      expect(result, const Left(ApiFailure(message: "Invalid credentials")));
      verify(() => authRepository.logincustomer(any(), any())).called(1);
      verifyNever(() => tokenStorage.saveToken(any()));
    });

    test('returns Failure when username is empty', () async {
      // Arrange
      const emptyusernameData =
          LoginParams(username: "", password: "pradip123");
      when(() => authRepository.logincustomer(any(), any())).thenAnswer(
          (_) async =>
              const Left(ApiFailure(message: "username cannot be empty")));

      // Act
      final result = await loginUseCase(emptyusernameData);

      // Assert
      expect(
          result, const Left(ApiFailure(message: "username cannot be empty")));
      verify(() => authRepository.logincustomer(any(), any())).called(1);
      verifyNever(() => tokenStorage.saveToken(any()));
    });

    test('returns Failure when password is empty', () async {
      // Arrange
      const emptyPasswordData = LoginParams(username: "pradip", password: "");
      when(() => authRepository.logincustomer(any(), any())).thenAnswer(
          (_) async =>
              const Left(ApiFailure(message: "Password cannot be empty")));

      // Act
      final result = await loginUseCase(emptyPasswordData);

      // Assert
      expect(
          result, const Left(ApiFailure(message: "Password cannot be empty")));
      verify(() => authRepository.logincustomer(any(), any())).called(1);
      verifyNever(() => tokenStorage.saveToken(any()));
    });

    test('returns Failure on server error', () async {
      // Arrange
      when(() => authRepository.logincustomer(any(), any())).thenAnswer(
          (_) async => const Left(ApiFailure(message: "Server error")));

      // Act
      final result = await loginUseCase(loginData);

      // Assert
      expect(result, const Left(ApiFailure(message: "Server error")));
      verify(() => authRepository.logincustomer(any(), any())).called(1);
      verifyNever(() => tokenStorage.saveToken(any()));
    });

    test('logs in successfully and stores token', () async {
      // Arrange
      when(() => authRepository.logincustomer(any(), any()))
          .thenAnswer((_) async => const Right(mockToken));
      when(() => tokenStorage.saveToken(any()))
          .thenAnswer((_) async => const Right(null));
      when(() => tokenStorage.getToken())
          .thenAnswer((_) async => const Right(mockToken));

      // Act
      final result = await loginUseCase(loginData);

      // Assert
      expect(result, const Right(mockToken));
      verify(() => authRepository.logincustomer(
          loginData.username, loginData.password)).called(1);
      verify(() => tokenStorage.saveToken(mockToken)).called(1);
      verify(() => tokenStorage.getToken()).called(1);
    });
  });
}
