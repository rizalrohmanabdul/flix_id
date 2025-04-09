import 'package:flix_id/data/repositories/authentication.dart';
import 'package:flix_id/domain/entities/result.dart';

class DummyAuthentication implements Authentication {

  @override
  String? getLoggedInUser() {
    // TODO: implement getLoggedInUser
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Result.failed('login Gagal Username atau password salah');
    // const Result.success('ID-12345');
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register({required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
} 