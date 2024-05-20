//authentication_api.dart
import 'dart:async';
import 'dart:io';
import 'package:managresguard/data/helpers/http.dart';
import 'package:managresguard/data/helpers/http_method.dart';
import 'package:managresguard/domain/responses/login_response.dart';
import '../../../domain/models/asociado_model.dart';
import '../../helpers/http_result.dart';

class AssociadoAPI {
  final Http _http;
  late final error;
  AssociadoAPI(this._http);

  Future<HttpResult<ApiResponse>> login(String cpfcpnj, String password) async {
    try {
      final result = await _http.request<ApiResponse>(
        '/associado/buscar',
        queryParameters: {"cpf_cnpj": cpfcpnj, "password": password},
        method: HttpMethod.get,
        parser: (data) {
          return ApiResponse.fromJson(data);
        },
      );

      if (result.error == null) {
        //print("result data ${result.data}");
        //print("result statusCode ${result.statusCode}");
        return HttpResult<ApiResponse>(
          data: result.data,
          statusCode: result.statusCode,
          error: null,
        );
      } else {
        print("result error ${result.error?.exception}");
        print("result error ${result.error?.stackTrace}");
        print("result statusCode ${result.statusCode}");
        return HttpResult<ApiResponse>(
          data: null,
          statusCode: result.statusCode,
          error: result.error,
        );
      }
    } on SocketException catch (e) {
      return HttpResult<ApiResponse>(
        data: null,
        statusCode: 500,
        error: HttpError(
          data: null,
          exception: Exception('Network Error'),
          stackTrace: StackTrace.current,
        ),
      );
    } on TimeoutException catch (e) {
      return HttpResult<ApiResponse>(
        data: null,
        statusCode: 500,
        error: HttpError(
          data: null,
          exception: Exception('Timeout Error'),
          stackTrace: StackTrace.current,
        ),
      );
    } catch (e) {
      return HttpResult<ApiResponse>(
        data: null,
        statusCode: 500,
        error: HttpError(
          data: null,
          exception: Exception('Unknown Error'),
          stackTrace: StackTrace.current,
        ),
      );
    }
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
