import 'dart:async';
import 'dart:io';
import 'package:managresguard/data/helpers/http.dart';
import 'package:managresguard/data/helpers/http_method.dart';
import 'package:managresguard/domain/responses/login_response.dart';

class AutheticationAPI {
  final Http _http;
  late final error; 
  AutheticationAPI(this._http);

  Future<LoginResponse> login(String email, String password) async {
    final result = await _http.request<String>(
      '/api/login',
      queryParameters: {
        "delay": "0" ,
      }, 
      method: HttpMethod.post,
      body: {
        "email": email, 
        "password": password
      },
      parser: (data){
        return data['token'];
      }
    );
    
    error = result.error?.exception;

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error ${result.error?.exception}");
    print("result error ${result.error?.stackTrace}");
    print("result statusCode ${result.statusCode}");

    if (result.error == null) {
      return LoginResponse.ok;
    }
    if (result.statusCode == 400) {
      return LoginResponse.accesDenied;
    }

    if (error is SocketException || error is TimeoutException) {
      return LoginResponse.networkError;
    }

    return LoginResponse.networkError;
  } 
}
