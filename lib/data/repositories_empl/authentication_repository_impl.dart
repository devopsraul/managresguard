import 'package:managresguard/data/data_source/remote/authentication_api.dart';
import 'package:managresguard/domain/repositories/authentication_repository.dart';
import 'package:managresguard/domain/responses/login_response.dart';

class AuthenticacionRepositoryImpl implements AuthenticacionRepository {
  final AutheticationAPI _api;

  AuthenticacionRepositoryImpl(this._api);

  @override
  Future<String?> get accesToken async{
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<LoginResponse> login(String email, String password){
    return _api.login(email, password);
  }
} 