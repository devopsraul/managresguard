//authentication_repository_impl.dart
import 'dart:async';
import 'dart:io';
import '../../domain/responses/login_response.dart';
import '../../domain/models/asociado_model.dart';
import '../../domain/repositories/repository.dart';
import '../data_source/remote/associado_api.dart';
import '../helpers/http_result.dart';

class AssociadoRepositoryImpl implements AssociadoRepository {
  final AssociadoAPI _api;

  AssociadoRepositoryImpl(this._api);

  @override
  Future<String?> get accesToken async {
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<HttpResult<ApiResponse>> login(String email, String password) async {
    final result = await _api.login(email, password);

    if (result.error == null) {
      return HttpResult<ApiResponse>(
        data: result.data,
        statusCode: result.statusCode,
        error: null,
      );
    }
    if (result.statusCode == 400) {
      return HttpResult<ApiResponse>(
        data: null,
        statusCode: result.statusCode,
        error: HttpError(
          data: result.data,
          exception: Exception('Access Denied'),
          stackTrace: StackTrace.current,
        ),
      );
    }

    if (result.error is SocketException || result.error is TimeoutException) {
      return HttpResult<ApiResponse>(
        data: null,
        statusCode: result.statusCode,
        error: HttpError(
          data: result.data,
          exception: Exception('Network Error'),
          stackTrace: StackTrace.current,
        ),
      );
    }

    return HttpResult<ApiResponse>(
      data: null,
      statusCode: result.statusCode,
      error: HttpError(
        data: result.data,
        exception: Exception('Unknown Error'),
        stackTrace: StackTrace.current,
      ),
    );
  }
}