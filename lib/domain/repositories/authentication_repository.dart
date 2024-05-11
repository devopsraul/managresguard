import '../responses/login_response.dart';

abstract class AuthenticacionRepository {
  Future<String?> get accesToken;
  Future<LoginResponse> login(String email, String password);
}