//authentication_repository_impl.dart
import 'dart:async';
import 'dart:io';
import '../../domain/models/veiculo_model.dart';
import '../../domain/repositories/repository.dart';
import '../data_source/remote/veiculo_api.dart';
import '../helpers/http_result.dart';

class VeiculoRepositoryImpl implements VeiculoRepository {
  final VeiculoAPI _vapi;

  VeiculoRepositoryImpl(this._vapi);

  @override
  Future<String?> get accesToken async {
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<HttpResult<VeiculoResponse>> buscar(String codVeiculo) async {
    final result = await _vapi.buscar(codVeiculo);

    if (result.error == null) {
      return HttpResult<VeiculoResponse>(
        data: result.data,
        statusCode: result.statusCode,
        error: null,
      );
    }
    if (result.statusCode == 400) {
      return HttpResult<VeiculoResponse>(
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
      return HttpResult<VeiculoResponse>(
        data: null,
        statusCode: result.statusCode,
        error: HttpError(
          data: result.data,
          exception: Exception('Network Error'),
          stackTrace: StackTrace.current,
        ),
      );
    }

    return HttpResult<VeiculoResponse>(
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