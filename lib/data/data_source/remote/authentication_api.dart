import 'dart:async';
import 'dart:io';
import 'package:managresguard/data/helpers/http.dart';
import 'package:managresguard/data/helpers/http_method.dart';
import 'package:managresguard/domain/responses/login_response.dart';
import '../../../domain/models/asociado_model.dart';

class AutheticationAPI {
  final Http _http;
  late final error;
  AutheticationAPI(this._http);

  Future<LoginResponse> login(String cpfcpnj, String password) async {
    final result = await _http.request<ApiResponse>(
      '/associado/buscar',
      queryParameters: {
        //  "delay": "0" ,
        "cpf_cnpj": cpfcpnj
      },
      method: HttpMethod.get,
      parser: (data) {
        //return data;
        return ApiResponse.fromJson(data);
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

  Future<LoginResponse> register(String email, String password) async {
    final result = await _http.request<String>('/associado/register',
        queryParameters: {
          //  "delay": "0" ,
        },
        method: HttpMethod.post,
        body: {"cpf_cnpj": email, "password": password}, parser: (data) {
      return data['access_token'];
    });

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
